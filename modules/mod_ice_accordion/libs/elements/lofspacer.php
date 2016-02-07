<?php 
/**
 * $ModDesc
 * 
 * @version   $Id: $file.php $Revision
 * @package   modules
 * @subpackage  $Subpackage.
 * @copyright Copyright (C) November 2010 LandOfCoder.com <@emai:landofcoder@gmail.com>.All rights reserved.
 * @license   GNU General Public License version 2
 */
 
// no direct access
defined('_JEXEC') or die;
/**
 * Get a collection of categories
 */
class JFormFieldLofspacer extends JFormField {
	
	/*
	 * Category name
	 *
	 * @access	protected
	 * @var		string
	 */
	protected $type = 'lofspacer'; 	
	
	/**
	 * fetch Element 
	 */
	protected function getInput(){		
		if (!defined ('LOF_LOADMEDIACONTROL')) {
			define ('LOF_LOADMEDIACONTROL', 1);
			$uri = str_replace(DS,"/",str_replace( JPATH_SITE, JURI::base (), dirname(__FILE__) ));
			$uri = str_replace("/administrator/", "", $uri);			
			JHTML::stylesheet($uri."/media/".'form.css');
			JHTML::script($uri."/media/".'form.js');
		}
		
		
//    $text   = (string)$this->element['text']?(string)$this->element['text']:'';
 ///   return '<div class="lof-header">'.JText::_($text).'</div>';
	}	
	/**
	 * Method to get the field label markup.
	 *
	 * @return	string	The field label markup.
	 * @since	1.6
	 */
	protected function getLabel()
	{
		$html = array();
		$class = $this->element['class'] ? (string) $this->element['class'] : '';

		$html[] = '<span class="spacer">';
		$html[] = '<span class="before"></span>';
		$html[] = '<span class="'.$class.'">';
		if ((string) $this->element['hr'] == 'true') {
			$html[] = '<hr class="'.$class.'" />';
		}
		else {
			$label = '';
			// Get the label text from the XML element, defaulting to the element name.
			$text = $this->element['label'] ? (string) $this->element['label'] : (string) $this->element['name'];
			$text = $this->translateLabel ? JText::_($text) : $text;

			// Build the class for the label.
			$class = !empty($this->description) ? 'hasTip' : '';
			$class = $this->required == true ? $class.' required' : $class;

			// Add the opening label tag and main attributes attributes.
			$label .= '<label id="'.$this->id.'-lbl" class="'.$class.'"';

			// If a description is specified, use it to build a tooltip.
			if (!empty($this->description)) {
				$label .= ' title="'.htmlspecialchars(trim($text, ':').'::' .
							($this->translateDescription ? JText::_($this->description) : $this->description), ENT_COMPAT, 'UTF-8').'"';
			}

			// Add the label text and closing tag.
			$label .= '>'.$text.'</label>';
			$html[] = $label;
		}
		$html[] = '</span>';
		$html[] = '<span class="after"></span>';
		$html[] = '</span>';
		return implode('',$html);
	}
	/**
	 * Method to get the field title.
	 *
	 * @return	string	The field title.
	 * @since	1.6
	 */
	protected function getTitle()
	{
		return $this->getLabel();
	}
}

?>


