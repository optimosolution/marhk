<?php
 /**
  * @version $Id$
  *  @package IceTheme IceOptimizer extenion
  *  @subpackage	IceTheme PlgSYstemId_Optimizer
  *  @copyright Copyright (C) 2010 IceTheme. All rights reserved.
  *  @license http://www.gnu.org/copyleft/gpl.html GNU/GPL, see LICENSE.php
  */
// Check to ensure this file is included in Joomla! 
  defined('_JEXEC') or die( 'Restricted access' );
  
  class JFormFieldItaddrow extends JFormField {
  	/**
	* Element name
	*
	* @access	protected
	* @var		string
	*/
	var	$_name = 'ItAddRow';
	
	function  getInput()
	{
		
		$cname = $this->name.'[]';
		$values = $this->value;
		if( !is_array($values) && empty($values) ){
			$values = array();
		}
		$values = !is_array($values) ? array($values):$values;
		$row ='';
		foreach( $values as $value ){
			$row .= '
				<div class="row">
					<input type="text" value="'.$value.'" name="'.$cname.'">
					<span class="remove"></span>
				</div>
			';
		}
		return '<fieldset class="it-addrow-block"><legend><span id="btna-'.$this->fieldname.'" class="add">Add Row</span></legend>'.$row.'</fieldset>';
	}
  }

?>
