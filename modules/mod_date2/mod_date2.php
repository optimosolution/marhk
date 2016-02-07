<?php
/**
 * @version	$Id: mod_date2.php 17 2011-07-20 13:10:49Z ty2u $
 * @package	mod_date2
 * @copyright	(C) Copyright 2011 Ryan Rhode, All rights reserved.
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

// no direct access
defined('_JEXEC') or die('Restricted access');

// get helper
require_once (dirname(__FILE__).DS.'helper.php');

// get some params
$showtime 				= $params->get( 'showtime' );
$showdate 				= $params->get( 'showdate' );
$pretext 				= $params->get( 'pretext' );
$posttext 				= $params->get( 'posttext' );
$styles 				= $params->get( 'styles' );

// get output
if ($showtime == 0 || $showdate == 0) {
	$output = modDate2Helper::getOutput($module, $params);
	
	if(isset($output)){
		// add styles
		$doc =& JFactory::getDocument();
		$style = '#ty2udate' . $module->id . ' {'.$styles.'}';
		$doc->addStyleDeclaration( $style );
	}
}

// output
require(JModuleHelper::getLayoutPath('mod_date2'));
?>