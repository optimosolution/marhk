<?php 
/**
 * $ModDesc
 * 
 * @version		$Id: helper.php $Revision
 * @package		modules
 * @subpackage	mod_lofflashcontent
 * @copyright	Copyright (C) JAN 2010 LandOfCoder.com <@emai:landofcoder@gmail.com>. All rights reserved.
 * @license		GNU General Public License version 2
 */
defined('_JEXEC') or die( 'Restricted access' );
/**
 * Get a collection of categories
 */ 	
class JFormFieldFtitle extends JFormField {
	
	/*
	 * Category name
	 *
	 * @access	protected
	 * @var		string
	 */
	var	$_name = 'ftitle';
	
	/**
	 * fetch Element 
	 */
	function getInput(){
		if(!defined('LOF_ADDED_TIME')){
			$mediaPath = JURI::root(). str_replace(DS, '/', str_replace(JPATH_ROOT, '',dirname(dirname(dirname(__FILE__)))));
			JHTML::stylesheet( $mediaPath .'/ice_speed/assets/form.css' );
			JHTML::stylesheet( $mediaPath .'/ice_speed/element/media/form.css' );
			define('LOF_ADDED_TIME',1);
		}
		$attributes = $this->element;
		$class = isset($attributes["class"])?$attributes:"lof-group-title";
		
		$title=  isset($attributes['title']) ?  JText::_($attributes['title']):JText::_('FTitle');
		$description = isset($attributes['description'])? JText::_($attributes['description']):"";
		
		$string = '<div '.($title?"":'style="display:none"').'  class="'.$class.'" title="'.$description.'">'.$title.'</div>';
		return $string;
	}
}

?>
