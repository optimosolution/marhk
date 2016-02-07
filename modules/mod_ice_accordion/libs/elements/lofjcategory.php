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

class JFormFieldlofjcategory extends JFormField
{
	protected $type 		= 'Lofjcategory';

	protected function getInput() {
		 if( !$this->isJshoppingExisted() ){
			return '<div class="ice-message">'.JText::_("JSHOPPING_DONT_INSTALL").'</div>';
		 }
		 $categories = buildTreeCategory(0);
		 $attributes = "";
		 $name = $this->name;
		if($this->element["multiple"]){
			$attributes = ' size="10" multiple = "multiple" ';
		}
		$notAll = isset($this->element["notAll"])?$this->element["notAll"]: false;
		$class = isset($this->element["class"])?"inputbox ".$this->element["class"]:"inputbox";
		
		if( !$notAll ){
			array_unshift($categories, JHTML::_('select.option', '', '- '.JText::_('LOF_SELECT_ALL').' -', 'category_id', 'name'));
		}
		else{
			array_unshift($categories, JHTML::_('select.option', '', '- '.JText::_('LOF_SELECT_NONE').' -', 'category_id', 'name'));
		}
		return JHTML::_('select.genericlist',  $categories,  $name, 'class="'.$class.'" '.$attributes, 'category_id', 'name', $this->value, $this->id );
	}
	  /**
     * check Jshopping Existed ?
     */
    public function isJshoppingExisted(){
      return is_file( JPATH_SITE.DS.  "components" . DS . "com_jshopping" . DS . "jshopping.php" ); 
    }
}