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
defined('_JEXEC') or die('Restricted access');
/**
 * Get a collection of categories
 */ 	
class JFormFieldFtitle extends JFormField
{	
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
	function getInput()
	{
		$attributes 	= $this->element;
		$class 			= isset($attributes["class"])?$attributes:"lof-group-title";
		$title			= isset($attributes['label']) ?  JText::_($attributes['label']):JText::_('EFFECT_SETTING');
		$description 	= isset($attributes['description'])? JText::_($attributes['label']):"";
		
		$string = '<div '.($title?"":'style="display:none"').'  class="'.$class.'" title="'.$description.'">'.$title.'</div>';
		return $string;
	}
}