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
class JFormFieldLoflabel extends JFormField {
	
	/*
	 * Category name
	 *
	 * @access	protected
	 * @var		string
	 */
	var	$_name = 'Loflabel';
	
	/**
	 * fetch Element 
	 */
	function getInput(){
		$attributes = $this->element;
		$text = $attributes['title'] ? (string) $attributes['title'] : (string) $attributes['name'];
		$class = isset($attributes['class'])?$attributes['class']:'';
		$description=  isset($attributes['description']) ?  JText::_($attributes['description']):'lof label';
		$string = '<div class="lof-label hasTip '.$class.'" title="'.JText::_( $text )."::".$description.'">'.JText::_( $text ).'</div>';
		return $string;
	}
}

?>
