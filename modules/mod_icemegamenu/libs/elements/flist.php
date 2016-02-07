<?php
/**
 * $ModDesc
 * 
 * @version		$Id: helper.php $Revision
 * @package		modules
 * @copyright	Copyright (C).
 * @license		GNU General Public License version 2
 
 */
// no direct access
defined('JPATH_BASE') or die();

class JElementFlist extends JElement
{
	/**
	* Element type
	*
	* @access	protected
	* @var		string
	*/
	var	$_name = 'Flist';

	function fetchElement($name, $value, &$node, $control_name)
	{
		$class = ( $node->attributes('class') ? 'class="'.$node->attributes('class').'"' : 'class="inputbox"' );
		$ismulti = $node->attributes('multiple');
		$size = $node->attributes("size");
		$size = !empty($size)?$size:10;
		$multi_select = $ismulti == 'true' ? 'multiple="multiple" size="'.$size.'" ':"";
		$element_name = $control_name.'['.$name.']';
		if(!empty($multi_select))
		{
			$element_name = $control_name.'['.$name.'][]';
			$multi_select .= " ".$class;
		}
		$options = array ();
		$options[0] = new stdClass();
		$options[0]->value = '';
		$options[0]->text = JText::_("Select All");
		foreach ($node->children() as $option)
		{
			$val	= $option->attributes('value');
			$text	= $option->data();
			$options[] = JHTML::_('select.option', $val, JText::_($text));
			//$options[] = JHTML::_('select.option', $val, JText::_($text));
		}

		return JHTML::_('select.genericlist',  $options, ''.$element_name, $multi_select, 'value', 'text', $value, $control_name.$name);
	}
}
