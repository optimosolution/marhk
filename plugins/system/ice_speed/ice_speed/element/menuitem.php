<?php
/**
* @version		$Id: menuitem.php 14401 2010-01-26 14:10:00Z louis $
* @package		Joomla.Framework
* @subpackage	Parameter
* @copyright	Copyright (C) 2005 - 2010 Open Source Matters. All rights reserved.
* @license		GNU/GPL, see LICENSE.php
* Joomla! is free software. This version may have been modified pursuant
* to the GNU General Public License, and as distributed it includes or
* is derivative of works licensed under the GNU General Public License or
* other free or open source software licenses.
* See COPYRIGHT.php for copyright notices and details.
*/

// Check to ensure this file is within the rest of the framework
defined('JPATH_BASE') or die();

/**
 * Renders a menu item element
 *
 * @package 	Joomla.Framework
 * @subpackage	Parameter
 * @since		1.5
 */

class JFormFieldMenuItem extends JFormField
{
	/**
	* Element name
	*
	* @access	protected
	* @var		string
	*/
	var	$_name = 'MenuItem';

	function  getInput()
	{	
		$std = new stdClass();
		$std->text = JText::_('--- Select All ----');
		$std->value='';
		$std->disable='';
		
		$tmp = array( $std );
		$selections = JHTML::_('menu.linkoptions');
		$selections = array_merge($tmp, $selections);


		return JHTML::_('select.genericlist',   $selections, ''.$this->name.'[]', 'class="inputbox" size="15" multiple="multiple"', 'value', 'text', $this->value, $this->name );
				 
		
	}
}
