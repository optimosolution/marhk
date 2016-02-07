<?php
/**
 * @version	$Id$
 * @package	mod_date2
 * @copyright	(C) Copyright 2011 Ryan Rhode, All rights reserved.
 * @author		Ryan Rhode, admin@ty2u.com
 * @license	This program is free software; you can redistribute it and/or modify
 *		it under the terms of the GNU General Public License as published by
 *		the Free Software Foundation; either version 2 of the License, or
 *		(at your option) any later version.
 *
 *		This program is distributed in the hope that it will be useful,
 *		but WITHOUT ANY WARRANTY; without even the implied warranty of
 *		MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *		GNU General Public License for more details.
 *
 *		You should have received a copy of the GNU General Public License along
 *		with this program;  If not, see http://www.gnu.org/licenses/gpl-2.0.html.
 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *
 *		Date and Time Module for Joomla!
 *		Displays the current time and date any way you want it.
 * 
 *		For help please visit http://www.ty2u.com/date-and-time
 *
 *		Please post any bugs, feature requests, support requests to:
 *		http://www.ty2u.com/forum
 */
defined('_JEXEC') or die();

jimport('joomla.form.helper');
JFormHelper::loadFieldClass('Editor');

abstract class JFormFieldEditor extends JFormField
{
	protected $type = 'editor';
	
	public function getInput() {
		$field = JFormHelper::loadFieldType('Textarea');
		return $field->getInput();
	}
	
	/**
	 * 
	 * @param unknown_type $name
	 * @param unknown_type $value
	 * @param unknown_type $node
	 * @param unknown_type $control_name
	 */
/*	function fetchElement($name, $value, &$node, $control_name)
	{
		$value = str_replace('<br />', "\n", $value);
		$editor =& JFactory::getEditor();
		
		return '<div style="position:relative;left:-64px;height:415px;display:block;overflow:hidden;">'.$editor->display( $control_name.'['.$name.']', $value, '100%', '300', '40', '15').'<div style="clear:both;"></div></div>';
	}*/
}
