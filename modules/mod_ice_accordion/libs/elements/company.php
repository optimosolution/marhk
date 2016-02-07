<?php
/**
 * @version 1.6.1 2011-07-25
 * @package Joomla
 * @subpackage Intellectual Property
 * @copyright (C) 2011 the Thinkery
 * @license GNU/GPL see LICENSE.php
 */

defined('JPATH_BASE') or die;

jimport('joomla.html.html');
jimport('joomla.form.formfield');
if(file_exists( JPATH_SITE.DS.'components'.DS.'com_iproperty'.DS.'helpers'.DS.'html.helper.php')){
	require_once (JPATH_SITE.DS.'components'.DS.'com_iproperty'.DS.'helpers'.DS.'html.helper.php' );
}
class JFormFieldCompany extends JFormField
{
    var	$_name = 'company';
	protected function _ipIsInstalled(){
		if(file_exists(JPATH_SITE.DS.'components'.DS.'com_iproperty'.DS.'iproperty.php'))
		{
			return true;
		}
		return false;
	}
	protected function getInput()
	{
		JPlugin::loadLanguage('com_iproperty', JPATH_ADMINISTRATOR);
		if($this->_ipIsInstalled()){
			$companies = ipropertyHTML::companySelectList('','','', true);
			$class = isset($this->element["class"])?" ".$this->element["class"]:"";
			$multiple = isset($this->element["multiple"])?$this->element["multiple"]:false;
			$multiple = ( $multiple==1 || $multiple == 'true' || $multiple == 'multiple' )?' multiple="multiple" size="8"':"";
			$name = $this->name;
			if(!empty($multiple)){
				$name = $this->name."[]";
			}
			return JHtml::_('select.genericlist', $companies, $name, 'class="inputbox'.$class.'"'.$multiple, 'value', 'text', $this->value, $this->id);
		}
		else{
			return '<div class="ice-message">'.JText::_("IPCOMPONENT_DONT_INSTALL").'</div>';
		}
	}
}


