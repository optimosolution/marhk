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
defined('_JEXEC') or die();
if(file_exists(JPATH_SITE.DS.'components'.DS.'com_jshopping'.DS.'lib'.DS.'factory.php'))
{
	require_once(JPATH_SITE.DS.'components'.DS.'com_jshopping'.DS.'lib'.DS.'factory.php');
	 JSFactory::loadLanguageFile();
}
if(file_exists(JPATH_SITE.DS.'components'.DS.'com_jshopping'.DS.'lib'.DS.'functions.php'))
{
	require_once(JPATH_SITE.DS.'components'.DS.'com_jshopping'.DS.'lib'.DS.'functions.php');
}
if(file_exists(JPATH_SITE.DS.'administrator'.DS.'components'.DS.'com_jshopping'.DS.'models'.DS.'manufacturers.php'))
{
	require_once(JPATH_SITE.DS.'administrator'.DS.'components'.DS.'com_jshopping'.DS.'models'.DS.'manufacturers.php');
}
class JFormFieldlofmanufacture extends JFormField
{
	protected $type 		= 'Lofmanufacture';

	protected function getInput() {
		 if( !$this->isJshoppingExisted() ){
			return '<div class="ice-message">'.JText::_("JSHOPPING_DONT_INSTALL").'</div>';
		 }
		$attributes = "";
		 $name = $this->name;
		if($this->element["multiple"]){
			$size = isset($this->element["size"])?$this->element["size"]: 10;
			$attributes = ' size="'.$size.'" multiple = "multiple" ';
		}
		$_manufacturer = new JshoppingModelManufacturers();
        $manufs = $_manufacturer->getAllManufacturers(0);
		$class = isset($this->element["class"])?"inputbox ".$this->element["class"]:"inputbox";
		$notAll = isset($this->element["notAll"])?$this->element["notAll"]: false;
		if(!$notAll){
			array_unshift($manufs, JHTML::_('select.option', '', '- '.JText::_('LOF_SELECT_NONE').' -', 'manufacturer_id', 'name'));
		}
		else{
			array_unshift($manufs, JHTML::_('select.option', '', '- '.JText::_('LOF_SELECT_NONE').' -', 'manufacturer_id', 'name'));
		}
		return JHTML::_('select.genericlist',  $manufs,  $name, 'class="'.$class.'"'.$attributes, 'manufacturer_id', 'name', $this->value, $this->id );
	}
	  /**
     * check Jshopping Existed ?
     */
    public function isJshoppingExisted(){
      return is_file( JPATH_SITE.DS.  "components" . DS . "com_jshopping" . DS . "jshopping.php" ); 
    }
}