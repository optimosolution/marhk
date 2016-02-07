<?php
// no direct access
defined('_JEXEC') or die('Restricted access');

jimport('joomla.form.formfield');

class JFormFieldLoad extends JFormField {

	protected $type = 'Load';

	protected function getInput()
	{
		// hide editor labels
		$doc =& JFactory::getDocument();
		$style = '#jform_params_pretext-lbl, #jform_params_posttext-lbl {display:none;}'; 
		$doc->addStyleDeclaration( $style );

		return;
	}
}