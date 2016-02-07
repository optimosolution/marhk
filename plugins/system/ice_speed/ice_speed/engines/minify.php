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

require_once ( dirname(__FILE__) . DS . 'Minify' . DS . 'CSS.php' );
require_once ( dirname(__FILE__) . DS . 'Minify' . DS . 'HTML.php' );
require_once ( dirname(__FILE__) . DS . 'Minify' . DS . 'jsmin.php' );
require_once ( dirname(__FILE__) . DS . 'Minify' . DS . 'YUICompressor.php' );
/**
 * MinifyEngine Class.
 */
class MinifyEngine extends ItEngineBase {

	/**
	 * @var string $__name; 
	 *
	 * @access private;
	 */	
	var $__name = 'Minify Engine';
	
	/**
	 * contructor
	 */
	function __construct(){
		parent::__construct();
	}
	
	function  MinifyEngine(){
		return $this->__construct();
	}
	
	/**
	 * override method: get content of css files
	 */
	function getJsContents( $files, $isCompressed=true, $isYUI = false  ){
		$contents = "/**ICE-ENGINE-JS**/";
		foreach( $files as $file ){ 
			$subpath  = str_replace( '/', DS, $file );
			$fullpath = JPATH_ROOT.DS . $subpath;	
				//	$basepath = preg_replace( '/^\//', '', dirname($files2[$key]) );
        		$contentFile = '';
        		if( preg_match('/\.php/', $file) ){ 
       				$contentFile = @file_get_contents( JURI::base(). str_replace( "&amp;", "&", $file) );  
        		}else if( file_exists($fullpath) ) {
				// get Content Of File;
				$contentFile = @file_get_contents( $fullpath );
			}
        	if( $contentFile ) {
        		$contents  .= "/** '.$subpath.' **/\t";
				$contents .= $contentFile;	
			}
		}
		if( $isCompressed ) { 
			if($isYUI){
				  $app =& JFactory::getApplication();
				  Minify_YUICompressor::$jarFile = dirname(__FILE__) . DS . 'Minify' . DS.'yuicompressor-2.4.6.jar';
				  Minify_YUICompressor::$tempDir = $app->getCfg("tmp_path");
				  $contents = Minify_YUICompressor::minifyJs(
				  $contents
					,array('nomunge' => true, 'line-break' => 1000)
				  );
			}
			else{
				$contents = JSMin::minify( $contents );
			}
		}
		return $contents;
	} 	

	/**
	 * override method: get content of css files
	 */
	function getCssContents( $files, $isCompressed=true,$isYUI = false   ){ 
		$contents = "/**ICE-ENGINE-CSS**/"; 
		foreach( $files as $key => $file ){
			$subpath  = str_replace( '/', DS, $file );
			$fullpath = JPATH_ROOT.DS . $subpath;	
        		$basepath = preg_replace( '/^\//', '', dirname($this->getRequestURI().$file) );  
        		$contentFile = '';
        		if( preg_match('/\.php/', $file) ){ 
       				$contentFile = @file_get_contents( JURI::base(). str_replace( "&amp;", "&", $file) );  
        		}else if( file_exists($fullpath) ) {
				// get Content Of File;
				$contentFile = @file_get_contents( $fullpath );				
			}
			if( $contentFile ){
				//$contentFile = str_replace('url(..', 'url(/'.dirname($basepath), $contentFile );
				//$contentFile = str_replace('url(\'..', 'url(\'/'.dirname($basepath), $contentFile );
				//$contentFile = str_replace('url("..', 'url("/'.dirname($basepath), $contentFile );
				
				$contentFile = str_replace('url("', 'url("123', $contentFile);
				$contentFile = str_replace('url(\'', 'url(\'123', $contentFile);
				$contentFile = str_replace('url(', 'url(123', $contentFile);
				
				$path = dirname($this->getRequestURI().$file).'/';
				
				$contentFile = str_replace('url(123../', 'url('.dirname($path).'/', $contentFile);
				$contentFile = str_replace('url(\'123../', 'url(\''.dirname($path).'/', $contentFile);
				$contentFile = str_replace('url("123../', 'url("'.dirname($path).'/', $contentFile);
				
				$contentFile = str_replace('url(123\'123', 'url(\''.$path, $contentFile);
				$contentFile = str_replace('url(123"123', 'url("'.$path, $contentFile);
				$contentFile = str_replace('url(123', 'url('.$path, $contentFile);
				
				// start clean up file
				$contents  .= "/** '.$subpath.' **/\t";
				$contents  .= $this->cleanUpText( $contentFile );
			}
		}
		if( $isCompressed ) {
			if($isYUI){
			 $app =& JFactory::getApplication();
			  Minify_YUICompressor::$jarFile = dirname(__FILE__) . DS . 'Minify' . DS.'yuicompressor-2.4.6.jar';
			  Minify_YUICompressor::$tempDir = $app->getCfg("tmp_path");
			  $contents = Minify_YUICompressor::minifyCss(
			  $contents
			    ,array('nomunge' => true, 'line-break' => 1000)
			  );
			}
			else{
				$contents = Minify_CSS::process( $contents );
			}
		}
		return $contents; 
	}
	
	/**
	 * 
	 *
	 */ 	
	function minifyHTML( $params, $body ){
		$options    =   array();
		if( $params->get('optimize_js', 0)){
		    $options['cssMinifier'] =   array( 'Minify_CSS', 'process');
		}
		if( $params->get('optimize_css', 0)){
		    $options['jsMinifier']  =   array('JSMin', 'minify');
		}

		$body = Minify_HTML::minify( $body, $options ); 	
		return $body;
	}
	/**
	 * clean up
	 */
	function cleanUpText( $content ){ return $content;

	 	$content = preg_replace( '#/\*.*?\*/#', '', $content ); 
		$content = preg_replace( '!//[^\n\r]+!', '', $content );
          	$content = preg_replace( '/[\r\n\t\s]+/s', ' ', $content );
         
          	$content = preg_replace( '/^\s+/' , '', $content );
         	$content = preg_replace( '/[\s]*([\{\},;:])[\s]*/', '\1', $content ); 
         		
		return $content;	
	}
}
?>
