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
require_once("loffile.php");
 /**
  * ItEngineBase Class 
  *
  */
class ItEngineBase {

	/**
	 * @var string $__cacheEngine store Cache Engine Object
	 *
	 * @access private;
	 */
	var $__cacheEngine = '';
	
	/**
	 * @var string $__cacheGroup name of cache's group
	 *
	 * @var access private;
	 */
	var $__cacheGroup = 'plg_icespeed';
	
	/**
	 * @var 
	 * 
	 * @param
	 */
	var $__requestURI = '/';
	/**
	 * @var string $__name name of Cache Engine; 
	 *
	 * @access private;
	 */
	var $__name = 'Engines Base';
	 
	/**
	 * contructor
	 */
	function __construct( $enableCache=true ){
		
		$uri 	 = JURI::getInstance();
		$www     = $uri->toString( array('scheme', 'host', 'port') );
		$this->__requestURI = str_replace($www,'', JURI::base());
		
		$this->__cacheEngine = & JFactory::getCache( $this->__cacheGroup, 'callback', 'loffile' );
		$this->__cacheEngine->setCaching( $enableCache );
	}
	
	function  ItEngineBase(){
		return $this->__construct();
	}
	
	/**
	 * getter: get a Cache Engine Object
	 *
	 * return Object.
	 */
	function getCacheEngine(){
		return $this->__cacheEngine;
	}
	
	/**
	 * 
	 * @param $callback 
	 * @param array $args arguments passed.
	 * @return boolean.
	 */
	function loadCache( $callback, $args, $id ){
        	$cache = $this->getCacheEngine()->get($callback, $args, $id);
        	return isset( $cache );
	}
	
	/**
	 * Getter:
	 * 
	 */
	function getRequestURI(){
		return $this->__requestURI;
	}
	/**
	 * get Name of Cache File
	 * 
	 * @param string $id is id of cache file
	 * @return string.
	 */
	function getCacheFile( $id ){ 
	    	$cacheEngine    =   $this->getCacheEngine()->_getStorage();
    	    	$filepath 	=   $cacheEngine->_getFilePath( $id, $this->__cacheGroup );
        	return str_replace( array(JPATH_CACHE . DS . $this->__cacheGroup . DS,'.php'),'',$filepath ); 
	}
	
	
	/**
	 * build link tag or script tag
	 * 
	 * @param string $type is js or css 
	 * @return string is css or js tag.
	 */
	function buildTag( $file, $type='css', $prs=array() ){
		$tmp = !empty($prs) ? '&amp;'.implode( "&amp;",$prs ) :'';
		$link	=	JURI::base(true).'/plugins/system/ice_speed/ice_speed/?f='.$file.'.'.$type.$tmp;
		switch( $type ){
			case 'js':
				$tag = "  <script type=\"text/javascript\" src=\"%s\"></script>";

				break;
			default :
				$tag = "<link href=\"%s\"  rel=\"stylesheet\" type=\"text/css\" />";
				break;
		}
		return sprintf( $tag, $link );
		
	}
	
	/**
	 * Inject HTML Tag inside a tag.
	 *
	 * @param array $tag
	 * @param string $body is HTML Source
	 * @param string $tagj is tab injected.
	 * @return string $body is HTML Source after processed
	 */
	function injectTag( $tag, $body, $tagj ){ 
		$body = str_replace( $tagj, "{$tagj}\n".$tag, $body );
		return $body;
	}
	
	/**
	 * clean up html tags inside body content
	 *
	 * @param array $tags
	 * @param string $body is HTML Source
	 * @return string $body is HTML Source after processed
	 */
	function cleanUpTags( $tags, $body ) {
		foreach( $tags as $tag ) {
			$body = str_replace( $tag, '', $body);
		} 
		return $body; 	
	}	
	
	/**
	 * main entry point is called while processing
	 * 
	 * @param JParameter $params
	 * @param array $output
	 * @param string $body 
	 */
	function process( $params, $output, $body ){
			
		// if enable Gzip
		$linkExs = array();
		if( $isGzip = $params->get('enable_gzip') ){
			$isGzip = $this->loadGZip( $isGzip );
			if( $isGzip ){
				$linkExs=array( 'use=gzip' );
			}
		}
		if( $params->get('optimize_html',0) ){
			$body = $this->minifyHTML( $params, $body );
		}
		
		if( !empty($output['js']) && $params->get('optimize_js', 'compress') ){	
			// if only compress file;
			if(  $params->get('optimize_js', 'compress') == 'compress' ){ 
				$body =  $this->proccessOnlyCompressFile( $output,  $body, 'js', $linkExs );
			} else {
				$body =  $this->processOpitimizeFiles( $params,  $output, $body, $linkExs, 'js' );	
			}					
		}
		if( !empty($output['css']) && $params->get('optimize_css', 'compress') ){
			if(  $params->get('optimize_css', 'compress') == 'compress' ){ 
				$body =  $this->proccessOnlyCompressFile( $output,  $body, 'css', $linkExs );
			} else { 
				$body =  $this->processOpitimizeFiles( $params,  $output, $body, $linkExs );
			}				
		}
		return $body;
	}
	
	/**
	 * Processsing Only Merge or Merge + Compress files
	 * 
	 * @param JParameter $param
	 * @output array $output.
	 * @body string is HTML Source
	 * @param array $linkExs extra parameters adding on the link
	 * @param string $type is css or js
	 * @return string $body is HTML Source after processed.
	 */
	function processOpitimizeFiles( $params, $output, $body, $linkExs=array(),$type='css' ){
		$id = md5(serialize( implode("|", $output[$type]) ));	
		$useYUICompressor = $params->get("use_yui", 0);
		$isCompressed = preg_match( '/compress/', $params->get('optimize_'.$type,'compress') );
		$isCache = $this->loadcache( array($this, 'get'.ucfirst($type).'Contents'), 
					     array($output[$type], $isCompressed,$useYUICompressor), 
					     $id );
		if( $isCache ){ // echo '<Pre>'.print_r($output[$type.'Tags'],1); die;
			$body = $this->cleanUpTags( $output[$type.'Tags'], $body );
			$body = $this->injectTag( $this->buildTag($this->getCacheFile( $id ), $type, $linkExs) ,
					  	  $body, 
					  	  '</title>' );
		}
		return $body;
	}
	
	/**
	 * Processsing Only Compress filesREQUEST URI with joomla
	 * 
	 * @output array $output.
	 * @body string is HTML Source
	 * @param array $linkExs extra parameters adding on the link
	 * @param string $type is css or js
	 * @return string $body is HTML Source after processed.
	 */
	function proccessOnlyCompressFile( $output, $body, $type='css', $linkExs=array() ){
		foreach( $output[$type] as $key => $file ){
			$id = md5( serialize($file) ); 
		
			// check file added
			$isCache = $this->loadcache( array($this, 'get'.ucfirst($type).'Contents'),
						     array(array($file), true), 
						     $id  );
			if( $isCache ){ 
				$tag = $this->buildTag( $this->getCacheFile( $id ), $type, $linkExs );
				if( !isset($output[$type.'Tags'][$file]) || empty($output[$type.'Tags'][$file]) ){ // die;
					$body = $this->injectTag( $tag, $body, '</title>' );
				} else {
					$body = str_replace( $output[$type.'Tags'][$file], $tag, $body );
				}
			}
		}
		return $body;
	}
	/**
	 * Check, whether client supports compressed data
	 *
	 * @return	boolean
	 * @since	1.6		Replaces _clientEncoding method from 1.5.
	 */
	protected function clientEncoding()
	{
		if (!isset($_SERVER['HTTP_ACCEPT_ENCODING'])) {
			return false;
		}

		$encoding = false;

		if (false !== strpos($_SERVER['HTTP_ACCEPT_ENCODING'], 'gzip')) {
			$encoding = 'gzip';
		}

		if (false !== strpos($_SERVER['HTTP_ACCEPT_ENCODING'], 'x-gzip')) {
			$encoding = 'x-gzip';
		}

		return $encoding;
	}
	/**
	 * Load PHP Gzip Extension
	 *
	 * @param boolean $loadGzip
	 * @return boolean true if loaded.
	 */
	function loadGZip( $isGZ ) {		
		//$encoding = $this->clientEncoding();
		if (!$isGZ){
			$isGZ=false;
		}
		if (!extension_loaded('zlib') || ini_get('zlib.output_compression')) {
			$isGZ=false;
		}
		return $isGZ; 
	}
	 
	/**
	 * override method
	 */
	function getCssContents( $files, $isCompressed=true ){ return; }
	
	/**
	 * override method
	 */
	function getJsContents( $files, $isCompressed=true ){ return; }
	
	function minifyHTML( $params, $body ){ return $body; }
	
}
?>
