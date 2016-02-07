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
 * ItProcessor Class.
 */
class IceEngine extends ItEngineBase {
	
	/**
	 * @var string $__name; 
	 *
	 * @access private;
	 */
	var $__name = 'Ice Engine';
	 
	/**
	 * contructor
	 */
	function __construct(){
		parent::__construct();
	}
	
	function  IceEngine(){
		return $this->__construct();
	}
	
	/**
	 *
	 */
	function getJsContents( $files ){
		$contents = "/**ICE-ENGINE-JS**/";
		foreach( $files as $file ){ 
			$subpath  = str_replace( '/', DS, $file['subpath'] );
			$fullpath = JPATH_ROOT.DS . $subpath;	
        		$basepath = preg_replace( '/^\//', '', dirname($file['file']) );
        		$contents  .= "/** '.$subpath.' **/\t";
			$contents .= file_get_contents( $fullpath );	
		}	
		return $contents;
	} 	
	
	/**
	 *
	 */
	function getCssContents( $files ){ 
		$contents = "/**ICE-ENGINE-CSS**/";       
		foreach( $files as $file ){  
			$subpath  = str_replace( '/', DS, $file['subpath'] );
			$fullpath = JPATH_ROOT.DS . $subpath;	
        		$basepath = preg_replace( '/^\//', '', dirname($file['file']) );
       			
			// get Content Of File;
		
			$contentFile = file_get_contents( $fullpath );
			$contentFile = str_replace('url(..', 'url(/'.dirname($basepath), $contentFile );
        		$contentFile = str_replace('url(\'..', 'url(\'/'.dirname($basepath), $contentFile );
        		$contentFile = str_replace('url("..', 'url("/'.dirname($basepath), $contentFile );
        		// start clean up file
        		$contents  .= "/** '.$subpath.' **/\t";
			$contents  .= $this->cleanUpText( $contentFile );
		}
		return $contents; 
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
