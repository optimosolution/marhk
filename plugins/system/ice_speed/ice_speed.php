<?php 
 /**
  * @version $Id$
  *  @package IceTheme IceOptimizer extenion
  *  @subpackage	IceTheme PlgSYstemId_Optimizer
  *  @copyright Copyright (C) 2010 IceTheme. All rights reserved.
  *  @license http://www.gnu.org/copyleft/gpl.html GNU/GPL, see LICENSE.php
  */
// Check to ensure this file is included in Joomla! 
defined('_JEXEC') or die( 'Restricted access' );
// Import the parent class
jimport( 'joomla.plugin.plugin' );
jimport('joomla.html.parameter');
// include engine base class
require_once( dirname(__FILE__).DS. 'ice_speed' . DS . 'engine_base.php' );  
require_once( dirname(__FILE__).DS. 'ice_speed' . DS . 'helper.php' );  
error_reporting(0);
/**
 * The IT Optimizer System Plugin.
 */
class plgSystemIce_Speed extends JPlugin
{
	/**
	 * @var string $_cache JCache Object
	 *
	 * @var access private;
	 */
	 var $_cache = null;
	 
	/**
	 * @var string $__cacheGroup name of cache's group
	 *
	 * @var access private;
	 */
	var $__cacheGroup = 'plg_icespeed';
	
	/**
	 * @var string $_excludeFiles;
	 *
	 * @acess protected;
	 */
	var $_excludeFiles = array();
	
	/**
	 * @var array $_ItemidsCached store the list of Itemid which matched page using a page cache.
	 *
	 * @access protected;
	 */
	var $_ItemidsCached = array(); 
	
	/**
	 * @var boolean $_isPageCache 
	 *
	 * @access protected;
	 */
	var $_isPageCache = false;
	/**
	 *  constructor
	 */
	function __construct( &$subject, $config ){
		global  $_PROFILER;
		$mainframe = JFactory::getApplication();
		parent::__construct( $subject, $config );
		// if page cache is enabled.
		if( $this->params->get('enable_cache', 0) )
		{
			//Set the language in the class
			$config =& JFactory::getConfig();
			$options = array(
				'cachebase' 	=> JPATH_BASE.DS.'cache',
				'defaultgroup' 	=> 'page',
				'lifetime' 		=> $this->params->get('cachetime', 15) * 60,
				'enable_cache'	=> ($this->params->get('enable_cache', 1)) ? true : false,
				'caching'		=> false,
				'language'		=> $config->getValue('config.language', 'en-GB')
			);
			file_put_contents(JPATH_BASE.DS.'cache'.DS.'time.txt', $this->params->get('cachetime', 15) * 60);
			jimport('joomla.cache.cache');
			$this->_cache = JCache::getInstance('page', $options);
			
			$menu = $this->params->get('menu','');
			if( $menu != '' ){
				$this->_ItemidsCached = !is_array( $menu ) ? array( $menu ) : $menu; 
			}
			
		}
		// process clear cache from client request
		if( JRequest::getVar('icespeed') ){
			$this->processClearCacheRequest();
		}
		
		if( $mainframe->isAdmin() ) {
			// load js and css for proccessing client action.
			PlgIceSpeedHelper::loadAdminMediaFiles( 'ice_speed' );
			// trigger clear cache: automatic clear cache after saved, applied.
			if( JRequest::getVar('task') == 'apply' || JRequest::getVar('task') == 'save'  ){
				$this->processClearCacheRequest();
			}
		}
	}
	
	/**
	 * Trigger Event onAfterRender
	 */	
	function onAfterRender(){
	 	global  $_PROFILER;
		
		$mainframe = JFactory::getApplication();
		if( $mainframe->isAdmin() || JDEBUG ) {
			// display button clear cache 
			if( $this->params->get('button_clearcache','allow_admin') ){
				$this->makeClearCacheButton();
			}
			return;
		}	
	
		// Return if page is not in HTML format
		$document	=& JFactory::getDocument();		
		$doctype	= $document->getType();
		if ( $doctype != 'html' ) { return; }
		// get BODY HTML Source
		
		$body  = JResponse::getBody();
		$container = $this->params->get("container_lazy","");
		//Lazy load		
		if($this->params->get('lazy_load', 1)) {
			$text = '<script language="javascript" type="text/javascript" src="'.JURI::base().'plugins/system/ice_speed/ice_speed/assets/LazyLoad.js"></script>';
			if(!empty($container)){
				$text .= '<script type="text/javascript" language="javascript">window.addEvent("domready",function() {var lazyloader = new LazyLoad({elements:"'.$container.' img",onLoad: function(img){setTimeout(function(){img.setStyle("opacity", 0).fade(1);},500);}});});</script>';
			}
			else{
				$text .= '<script type="text/javascript" language="javascript">window.addEvent("domready",function() {var lazyloader = new LazyLoad({onLoad: function(img){setTimeout(function(){img.setStyle("opacity", 0).fade(1);},500);}});});</script>';
			}
			$body = str_replace("</head>", $text . "</head>", $body);
		}
		//End
		$output = $this->lookupJsCssRequests( $body );	
		$body  	= $this->processing( $output, $body );
		
		JResponse::setBody($body);
		
	 	$app = JFactory::getApplication();

		if ($app->isAdmin() || JDEBUG) {
			return;
		}
		if( $this->params->get('enable_cache', 0) )
		{
			$user = JFactory::getUser();
			if (!$user->get('guest')) {
				//We need to check again here, because auto-login plugins have not been fired before the first aid check			
				$this->_cache->store();
			}
		}
	 }
	
	/**
	 * Trigger Event onAfterInitialise: Converting the site URL to fit to the HTTP request
	 */
	function onAfterInitialise()
	{ 
		if( $this->params->get('enable_cache', 0) )
		{
			global $_PROFILER;
			$app	= JFactory::getApplication();
			$user	= JFactory::getUser();
	
			if ($app->isAdmin() || JDEBUG) {
				return;
			}
	
			if (!$user->get('guest') && $_SERVER['REQUEST_METHOD'] == 'GET') {
				$this->_cache->setCaching(true);
			}
	
			$data  = $this->_cache->get();
	
			if ($data !== false)
			{
				JResponse::setBody($data);
	
				echo JResponse::toString($app->getCfg('gzip'));
	
				if (JDEBUG)
				{
					$_PROFILER->mark('afterCache');
					echo implode('', $_PROFILER->getBuffer());
				}
	
				$app->close();
			}
		}
	}
	
	/**
	 * Lookup Css Requests and Js Requests made inside HTML page.
	 *
	 * @params string $body is HTML Source
	 * @return array has two dimensions 
	 */ 
	function lookupJsCssRequests( $body ){
		$sfiles    = array( 'js' =>array(), 'css' => array() );
		$regexCss  = '#<link(.*)href="([^\"]+)"(.*)>#iU';
		$regexJs   = '#<script([^\>]+)src="([^\"]+)"(.*)><\/script>#iU';		
  		//echo $wwwpath; 
  		
  		// exclude Css Files
		$excludeJs = $this->params->get( 'exclude_js', '' );
		$excludeJs = !is_array( $excludeJs ) ? array( $excludeJs ):$excludeJs; 
		$this->_excludeFiles = array_merge( $this->_excludeFiles, $excludeJs );
		
		// exclude Js Files
		$excludeCss = $this->params->get( 'exclude_css', '' );
		$excludeCss = !is_array( $excludeCss ) ? array( $excludeCss ):$excludeCss;
		
		$excludeCondition = $this->getExcludeCSSByCondition($body);
		if(count($excludeCondition))
		for($i = 0; $i < count($excludeCondition); $i++) {
			$link = $excludeCondition[$i];
			$link = preg_replace(array('~^'.JURI::base().'~','~^'.JURI::base(true).'/~'),'',$link);
			$excludeCss[] = $link;
		}
		
		$this->_excludeFiles = array_merge( $this->_excludeFiles, $excludeCss );
		//
		
  		$addCssFiles = $this->params->get('add_cssfiles','');
 		$addCssFiles = !is_array( $addCssFiles ) ? array( $addCssFiles ):$addCssFiles;
 		
 		$addJsFiles = $this->params->get('add_jsfiles','');
 		$addJsFiles = !is_array( $addJsFiles ) ? array( $addJsFiles ):$addJsFiles;
 		

  		// lookup css requests   
		if( $this->params->get('optimize_css', 'compress') && preg_match_all($regexCss, $body, $matches) ){
			if( !isset($matches[2]) ) return $output; 	
	  			foreach( $matches[2] as $key => $link ){	  				
					$realPath = preg_replace(array('~^'.JURI::base().'~','~^'.JURI::base(true).'/~'),'',$link);	
					$isExcluded = in_array(  trim($realPath), $this->_excludeFiles );	
					if( preg_match('/\.php/', $link) ){
						$tag =JUtility::parseAttributes( $matches[0][$key]);
						if( isset($tag['rel']) && strtolower($tag['rel']) == 'stylesheet' ){
							$sfiles['css'][] = $realPath;
	  						$sfiles['cssTags'][$realPath] = $matches[0][$key];
						}
					}
					
	  				if( preg_match('/\.css$/', $link) && !preg_match('/^http:\/\//', $realPath) && !$isExcluded ) {
	  					$sfiles['css'][] = $realPath;
	  					$sfiles['cssTags'][$realPath] = $matches[0][$key];
		  			}// enforeach;
	  		}
		} // endif;
		
		// custom order js files
		$orderJsFiles = $this->params->get('order_jsfiles','');
 		$orderJsFiles = !is_array( $orderJsFiles ) ? array( $orderJsFiles ):$orderJsFiles;
 		
 		$tmp = array();
		// lookup js requests   
		if( $this->params->get('optimize_js', 'compress') &&  preg_match_all($regexJs, $body, $matches) ){
			if( !isset($matches[2]) ) return $output;
				$matches[2] = array_merge($matches[2], $addJsFiles );
	  			foreach( $matches[2] as $key => $link ){ 
					$realPath = preg_replace(array('~^'.JURI::base().'~','~^'.JURI::base(true).'/~'),'',$link);
					$isExcluded = in_array(  $realPath, $this->_excludeFiles );			
					
					if( preg_match('/\.php/', $link) ){
					//	$tag =JUtility::parseAttributes( $matches[0][$key]);
					//	if( isset($tag['rel']) && strtolower($tag['type']) == 'type' ){
							$sfiles['js'][] = $realPath;
	  						$sfiles['jsTags'][$realPath] = $matches[0][$key];
					//	}
					}
					
	  				if( preg_match('/\.js$/', $link) && !preg_match('/^http:\/\//', $realPath) && !$isExcluded ) {	
	  					// sort files and only loading file needed.
	  					if( ($k=array_search($realPath, $orderJsFiles)) >= 0 ){
	  						$tmp[$k] = $orderJsFiles[$k];	
	  					}
	  					$sfiles['js'][] = $realPath;
	  					$sfiles['jsTags'][$realPath] = isset( $matches[0][$key])? $matches[0][$key]:"";
	  			}// endforeach;
	  		}
		} // endif;	
		ksort($tmp);
		$sfiles['css'] = array_merge( $sfiles['css'], $addCssFiles );
	 	$sfiles['js'] = array_unique(array_merge($tmp, $sfiles['js']));
		
		return $sfiles;	 
	 }
	 
	 /**
	  * call a engines object to process create caches and merge files. processing: merge, or compress codes, and create a new files
	  *
	  * @param array $output has two dimension which contain css, js collections.
	  * @param string $body is HTML source
	  * @return string is HTML source;
	  */
	function processing( $output, $body ){
	
		if( $engine = PlgIceSpeedHelper::getOpitimizeEngine($this->params->get('optimize_engine','minify')) ) { 
			return $engine->process( $this->params, $output, $body  );
		}
		
		return $body;	
	}
	
	/**
	 * process client requests to clear Joomla cache
	 */
	function processClearCacheRequest(){
		if( $this->params->get('button_clearcache','allow_admin') ){
			global $_PROFILER;
			$mainframe = JFactory::getApplication();
			$rightToken = $this->params->get( 'token' , 'ice' ); // echo $rightToken; die;
			if( $mainframe->isAdmin() ){ 
				return 	PlgIceSpeedHelper::clearAllCache( $this->params );	
			} else if( trim(JRequest::getVar('token')) == $rightToken ){
				return 	PlgIceSpeedHelper::clearAllCache( $this->params );	
			}
		}
	}
	
	/**
	 * Insert a clear cache button beside logout link inside the administrator 
	 */
	function makeClearCacheButton(){
		$body  = JResponse::getBody();
		$span   = '#<span([^\>]+)class="logout"(.*)>(.*)<\/span>#iU';
		preg_match( $span, $body, $match );	
		$title =  JText::_('Ice Optimizer')."::".JText::_('Click the button <br>to clear <b>Joomla</b> cache');
		if( isset($match) && isset($match[0]) ){
			$link = JURI::base().'?icespeed=clear';
			$bg= 'style="background:url('.JURI::root().'/plugins/system/ice_speed/ice_speed/assets/clear.png'.') no-repeat;"';
			$body = str_replace( $match[0], $match[0] . '<span  '.$bg.' class="it-btn-clearcache">'
							. '<a title="'.$title.'" class="hasTip"  href="'.$link.'">'.JText::_('Clear Cache').'</a>'
							. '</span>',
					     $body );
		}
		JResponse::setBody( $body ); 
	}
	
	/* Get list of CSS link avoid by: <!--[if ... <![endif]-->*/
	function getExcludeCSSByCondition($bodyString)
	{
		// Find script		
		$scriptRegex = "/<!--\[if[^\]]*?\][\s\S]*?<!\[endif\]-->/i";
		preg_match_all($scriptRegex, $bodyString, $matches);
		$regString   = "/([^\"\'=]+\.(css))[\"\']/i";
		
		if(isset($matches[0]))
			preg_match_all($regString, implode("", $matches[0]), $arrMatchs);
		else
			return array();
		
		if(isset($arrMatchs[1]))
			return $arrMatchs[1];
		else
			return array();
	}
}
?>
