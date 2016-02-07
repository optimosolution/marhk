<?php
/**
 * IceMegaMenu Extension for Joomla 1.6 By IceTheme
 * 
 * 
 * @copyright	Copyright (C) 2008 - 2011 IceTheme.com. All rights reserved.
 * @license		GNU General Public License version 2
 * 
 * @Website 	http://www.icetheme.com/Joomla-Extensions/icemegamenu.html
 * @Support 	http://www.icetheme.com/Forums/IceMegaMenu/
 *
 */
 
 
/* no direct access*/
defined('_JEXEC') or die('Restricted access');

/**
 * IceSimpleXml Class.
 *
 * @package		Joomla
 * @subpackage	Menus
 * @since		1.5
 */
jimport('joomla.utilities.simplexml');

class IceSimpleXml extends JSimpleXML
{
	/**
	 * Array with the attributes of this XML element
	 *
	 * @var array
	 */
	var $_attributes = array();

	/**
	 * The name of the element
	 *
	 * @var string
	 */
	var $_name = '';

	/**
	 * The data the element contains
	 *
	 * @var string
	 */
	var $_data = '';

	/**
	 * Array of references to the objects of all direct children of this XML object
	 *
	 * @var array
	 */
	var $_children = array();
	
	var $document = null;
	/**
	 * The level of this XML element
	 *
	 * @var int
	 */
	var $_level = 0;
	
	function __construct($name="", $attrs = array(), $level = 0)
	{
		parent::__construct( $name, $attrs, $level );
	}
}

class IceSimpleXmlElement extends JSimpleXMLElement
{
	public function name(){
		return parent::name();
	}
	public function data(){
		return parent::data();
	}
	public function getAttribute( $name ){
		return parent::getAttribute( $name );
	}
	public function asFormattedXML($compressed = false, $indent = "\t", $level = 0){
		return parent::asFormattedXML( $compressed, $indent, $level);
	}
	/**
	 * Return a well-formed XML string based on SimpleXML element
	 *
	 * @return string
	 */
	public function toString($whitespace=true)
	{
		//Start a new line, indent by the number indicated in $this->level, add a <, and add the name of the tag
		if ($whitespace) {
			$out = "\n".str_repeat("\t", $this->_level).'<'.$this->_name;
		} else {
			$out = '<'.$this->_name;
		}

		//For each attribute, add attr="value"
		foreach($this->_attributes as $attr => $value) {
			$out .= ' '.$attr.'="'.htmlspecialchars($value, ENT_COMPAT, 'UTF-8').'"';
		}
		//If there are no children and it contains no data, end it off with a />
		if (empty($this->_children) && empty($this->_data)) {
			$out .= " />";
		}
		else //Otherwise...
		{

			//If there are children
			if (!empty($this->_children))
			{
				//Close off the start tag
				$out .= '>';

				//For each child, call the asXML function (this will ensure that all children are added recursively)
				foreach($this->_children as $child)
					$out .= $child->toString($whitespace);
				$out.= htmlspecialchars($this->_data, ENT_COMPAT, 'UTF-8');
				//Add the newline and indentation to go along with the close tag
				if ($whitespace) {
					$out .= "\n".str_repeat("\t", $this->_level);
				}
			}

			//If there is data, close off the start tag and add the data
			elseif (!empty($this->_data)){
				$out .= '>'.htmlspecialchars($this->_data, ENT_COMPAT, 'UTF-8');
				}

			//Add the end tag
			$out .= '</'.$this->_name.'>';
		}

		//Return the final output
		return $out;
	}
}