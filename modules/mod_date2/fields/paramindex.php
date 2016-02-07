<?php
/**
 * @version	$Id$
 * @package	mod_date2
 * @copyright	(C) Copyright 2011 Ryan Rhode, All rights reserved.
 * @author		#@#AUTHOR#@#
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

defined('_JEXEC') or die();

/**
 * 
 * @author rrhode
 *
 */
class JElementParamIndex extends JElement
{
	var $_name = 'paramindex';
	
	/**
	 * 
	 * @param $name
	 * @param $value
	 * @param $node
	 * @param $control_name
	 */
	function fetchElement($name, $value, &$node, $control_name)
	{
		
		jimport( 'joomla.methods' );
		
		$paramindex = '
		<style>.jpane-slider {overflow:scroll !important;}</style>
		<a name="top"></a>
		<div style="text-align:left;width:100%;">
			<ol>
				<li>
					<a style="position:relative;top:0px;left:-40px;float:left;display:block;width: 16px; height: 16px; background: url(&quot;templates/khepri/images/menu/icon-16-info.png&quot;) no-repeat scroll 0% 0% transparent;" target="_blank" href="http://www.ty2u.com/date-and-time#systemoutput" title="Click for help"></a>
					'.JText::_('LABEL_SYSTEM_OUTPUT').'
					<br /><a href="#SYSTEM_OUTPUT">' 			. JText::_('SYSTEM_OUTPUT') 	. '</a><br />
				</li>
				<li>
					<a style="position:relative;top:0px;left:-40px;float:left;float:left;float:left;display:block; width: 16px; height: 16px; background: url(&quot;templates/khepri/images/menu/icon-16-info.png&quot;) no-repeat scroll 0% 0% transparent;" target="_blank" href="http://www.ty2u.com/date-and-time#method" title="Click for help"></a>
					'.JText::_('LABEL_GENERATION_METHOD').'
					<br /><a href="#GENERATION_METHOD">' 		. JText::_('GENERATION_METHOD') . '</a><br />
				</li>
				<li>
					<a style="position:relative;top:0px;left:-40px;float:left;float:left;display:block; width: 16px; height: 16px; background: url(&quot;templates/khepri/images/menu/icon-16-info.png&quot;) no-repeat scroll 0% 0% transparent;" target="_blank" href="http://www.ty2u.com/date-and-time#enclosure" title="Click for help"></a>
					'.JText::_('PRETEXT').'
					<br /><a href="#DESC_PRETEXT">' 				. JText::_('DESC_PRETEXT') 		. '</a><br />
				</li>
				<li>
					<a style="position:relative;top:0px;left:-40px;float:left;float:left;display:block; width: 16px; height: 16px; background: url(&quot;templates/khepri/images/menu/icon-16-info.png&quot;) no-repeat scroll 0% 0% transparent;" target="_blank" href="http://www.ty2u.com/date-and-time#enclosure" title="Click for help"></a>
					'.JText::_('POSTTEXT').'
					<br /><a href="#DESC_POSTTEXT">' 				. JText::_('DESC_POSTTEXT') 		. '</a><br />
				</li>
				<li>
					<a style="position:relative;top:0px;left:-40px;float:left;float:left;display:block; width: 16px; height: 16px; background: url(&quot;templates/khepri/images/menu/icon-16-info.png&quot;) no-repeat scroll 0% 0% transparent;" target="_blank" href="http://www.ty2u.com/date-and-time#display" title="Click for help"></a>
					'.JText::_('LABEL_DISPLAY').'
					<br /><a href="#DISPLAY">' 				. JText::_('DISPLAY') 			. '</a><br />
				</li>
				<li>
					<a style="position:relative;top:0px;left:-40px;float:left;float:left;display:block; width: 16px; height: 16px; background: url(&quot;templates/khepri/images/menu/icon-16-info.png&quot;) no-repeat scroll 0% 0% transparent;" target="_blank" href="http://www.ty2u.com/date-and-time#date" title="Click for help"></a>
					'.JText::_('LABEL_DATE').'
					<br /><a href="#DATE">' 					. JText::_('DATE') 				. '</a><br />
				</li>
				<li>
					<a style="position:relative;top:0px;left:-40px;float:left;float:left;display:block; width: 16px; height: 16px; background: url(&quot;templates/khepri/images/menu/icon-16-info.png&quot;) no-repeat scroll 0% 0% transparent;" target="_blank" href="http://www.ty2u.com/date-and-time#time" title="Click for help"></a>
					'.JText::_('LABEL_TIME').'
					<br /><a href="#TIME">' 					. JText::_('TIME') 				. '</a><br />
				</li>
				<li>
					<a style="position:relative;top:0px;left:-40px;float:left;float:left;display:block; width: 16px; height: 16px; background: url(&quot;templates/khepri/images/menu/icon-16-info.png&quot;) no-repeat scroll 0% 0% transparent;" target="_blank" href="http://www.ty2u.com/date-and-time#separators" title="Click for help"></a>
					'.JText::_('LABEL_SEPARATORS').'
					<br /><a href="#SEPARATORS">' 			. JText::_('SEPARATORS') 		. '</a><br />
				</li>
				<li>
					<a style="position:relative;top:0px;left:-40px;float:left;float:left;display:block; width: 16px; height: 16px; background: url(&quot;templates/khepri/images/menu/icon-16-info.png&quot;) no-repeat scroll 0% 0% transparent;" target="_blank" href="http://www.ty2u.com/date-and-time#daysofweek" title="Click for help"></a>
					'.JText::_('LABEL_DAYOFWEEK_OUTPUT').'
					<br /><a href="#DAYOFWEEK_OUTPUT">' 		. JText::_('DAYOFWEEK_OUTPUT') 	. '</a><br />
				</li>
				<li>
					<a style="position:relative;top:0px;left:-40px;float:left;float:left;display:block; width: 16px; height: 16px; background: url(&quot;templates/khepri/images/menu/icon-16-info.png&quot;) no-repeat scroll 0% 0% transparent;" target="_blank" href="http://www.ty2u.com/date-and-time#month" title="Click for help"></a>
					'.JText::_('LABEL_MONTH_OUTPUT').'
					<br /><a href="#MONTH_OUTPUT">' 			. JText::_('MONTH_OUTPUT') 		. '</a><br />
				</li>
				<li>
					<a style="position:relative;top:0px;left:-40px;float:left;display:block; width: 16px; height: 16px; background: url(&quot;templates/khepri/images/menu/icon-16-info.png&quot;) no-repeat scroll 0% 0% transparent;" target="_blank" href="http://www.ty2u.com/date-and-time#daysofmonth" title="Click for help"></a>
					'.JText::_('LABEL_DAYOFMONTH_OUTPUT').'
					<br /><a href="#DAYOFMONTH_OUTPUT">' 		. JText::_('DAYOFMONTH_OUTPUT')	. '</a><br />
				</li>
				<li>
					<a style="position:relative;top:0px;left:-40px;float:left;display:block; width: 16px; height: 16px; background: url(&quot;templates/khepri/images/menu/icon-16-info.png&quot;) no-repeat scroll 0% 0% transparent;" target="_blank" href="http://www.ty2u.com/date-and-time#year" title="Click for help"></a>
					'.JText::_('LABEL_YEAR_OUTPUT').'
					<br /><a href="#YEAR_OUTPUT">' 		. JText::_('YEAR_OUTPUT')	. '</a><br />
				</li>
			</ol>
			<a href="#BOTTOM">Goto Bottom</a>
		</div>

		';
		
		
		return $paramindex; 
	}
}
