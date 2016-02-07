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
class JFormFieldFcolorpicker extends JFormField {
	
	/*
	 * Category name
	 *
	 * @access	protected
	 * @var		string
	 */
	var	$_name = 'Fcolorpicker';
	
	/**
	 * fetch Element 
	 */
	function getInput(){
		$this->loadJs();
		$value = $this->value?$this->value:(string)$this->element['default'];
		$string =  '<input class="color" value="'.$value.'" name="'.$this->name.'" >';
		return $string;	
	}
	
	protected function loadJs()
	{
		$mediaPath = JURI::root(). str_replace(DS, '/', str_replace(JPATH_ROOT, '',dirname(dirname(dirname(__FILE__))))).'/libs/elements/';
		if (!defined ('_F_COLORPICKER_')) {
			define ('_F_COLORPICKER_', 1);
			JHTML::script($mediaPath.'fcolorpicker/jscolor.js');
		}
	}
}

?>
