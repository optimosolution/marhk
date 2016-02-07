<?php
 /**
  * @version $Id$
  *  @package IceTheme IceOptimizer extenion
  *  @subpackage	IceTheme PlgSYstemId_Optimizer
  *  @copyright Copyright (C) 2010 IceTheme. All rights reserved.
  *  @license http://www.gnu.org/copyleft/gpl.html GNU/GPL, see LICENSE.php
  */
// No direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

/**
 * ItPlgOptimizerHelper  Class
 */
 
class PlgIceSpeedHelper{
	
	/**
	 * Clear All Joomla Cache from front-end and back-end
	 * 
	 * @param JParameter $params;
	 */
	function clearAllCache( $params ){		
		PlgIceSpeedHelper::clean();
	}		
	
	/**
	 * Clean out a cache group as named by param.
	 * If no param is passed clean all cache groups.
	 *
	 * @param String $group
	 */
	public function clean($group = '')
	{
		$conf = JFactory::getConfig();
		//Clear cache in fontend
		$path  = $conf->get('cache_path', JPATH_ROOT.DS.'cache');
		$cache = PlgIceSpeedHelper::getCache($path);
		$cache->clean($group);
		//Clear cache in backend
		$path  = JPATH_ROOT.DS.'administrator'.DS.'cache';
		$cache = PlgIceSpeedHelper::getCache($path);
		$cache->clean($group);
	}
	
	/**
	 * Method to get cache instance
	 *
	 * @return object
	 */
	public function getCache($path = '')
	{
		$conf = JFactory::getConfig();

		$options = array(
			'defaultgroup'	=> '',
			'storage' 		=> $conf->get('cache_handler', ''),
			'caching'		=> true,
			'cachebase'		=> $path
		);

		jimport('joomla.cache.cache');

		// We need to clear the previously used cache handlers, otherwise backend cachebase can't be used
		JCache::$_handler = array();

		$cache = JCache::getInstance('', $options);
		return $cache;
	}
	/**
	 * Clear Joomla Cache By groups, just apply for the front-page.
	 *
	 * @param array $group
	 */
	function clearCacheByGroups( $params, $groups ){
		// include cache model from the cache component
		$file =  JPATH_ADMINISTRATOR.DS.'components'.DS.'com_cache'.DS.'cache.class.php';
		if( file_exists($file) ){
			$client	=& JApplicationHelper::getClientInfo( 0 );
			$cmData = new CacheData( $client->path . DS . 'cache' );
			return $cmData->cleanCacheList( $groups );
		}
	}	
	
	/**
	 *
	 * @param string $engine 
	 *
	 * @return Object is a instance of ItEngineBase Object
	 */
	function getOpitimizeEngine( $engine ){
		$file = dirname(__FILE__).DS.'engines'.DS.$engine.'.php';
	
		if( file_exists($file) ) {
			require_once( $file );
			$class = ucfirst( $engine ).'Engine';
			return class_exists($class) ? new $class() : null;
		}	
		return null;
	}
	
	/**
	 * add Loading Js and css file in the administrator side.
	 *
	 * @param string $pluginName;
	 */	
	function loadAdminMediaFiles( $pluginName ){
		JHTML::_('behavior.mootools');
		JHTML::stylesheet( 'plugins/system/'.$pluginName.'/'.$pluginName.'/assets/style.css' );
		JHTML::script( 'plugins/system/'.$pluginName.'/'.$pluginName.'/assets/script.js'  );	
	}
	
	/**
	 * check URL is enable using cache page or not.
	 *
	 * @param array $items
	 * @param string $url
	 * @return boolean is true if enable.
	 */
	function isEnableCachedByUrl(  $items, $url, $params ){
		$menus = &JSite::getMenu();
		$uri = &JURI::getInstance();
		$host= $uri->toString(array('scheme','host','port'));
		// store data into cache
		$cache =& JFactory::getCache();
		$cache->setCaching( true );
		$cache->setLifeTime( $params->get( 'cache_time', 30 ) * 60 );	
		$output = $cache->get( array( 'PlgIceSpeedHelper' , '_renderLink' ), array($host, $items) ); 
		$output = PlgIceSpeedHelper::_renderLink( $host, $items );

		if( empty($output) ){return false; }
		return isset($output[trim(str_replace($host, '',$url))]);
	}	
	
	/**
	 *
	 *
	 */
	function _renderLink( $host, $items ){
		$menus = &JSite::getMenu();
		$uri = &JURI::getInstance();
		$output = array();
		foreach( $items as $item ){  
			if( (int)$item > 0 ) { 
				$tmp = $menus->getItem( (int)$item );
				$iParams = new JParameter( $tmp->params );
				switch ($tmp->type) {
					case 'url' :
						if ((strpos($tmp->link, 'index.php?') === 0) && (strpos($tmp->link, 'Itemid=') === false)) {
							$tmp->url = $tmp->link.'&amp;Itemid='.$tmp->id;
						} else {
							$tmp->url = $tmp->link;
						}
						break;
					default :
						$router = JSite::getRouter();
						$tmp->url = $router->getMode() == JROUTER_MODE_SEF ? 'index.php?Itemid='.$tmp->id : $tmp->link.'&Itemid='.$tmp->id;
						break;
				} // 
				$iSecure = $iParams->def('secure', 0);
				if ($tmp->home == 1) {
					$tmp->url = JURI::base();
				} elseif (strcasecmp(substr($tmp->url, 0, 4), 'http') && (strpos($tmp->link, 'index.php?') !== false)) {
					$tmp->url = JRoute::_($tmp->url, true, $iSecure);
				} else {
					$tmp->url = str_replace('&', '&amp;', $tmp->url);
				}
				
				$output[trim(str_replace($host, '',$tmp->url))] = $tmp->url; 		
		//		if( str_replace($host, '',$url) ==  str_replace($host, '',$tmp->url) ){ 
		//			return true;
		//		} 
			}
		}
		return $output;
	}	
} 
?>
