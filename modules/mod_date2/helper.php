<?php
/**
 * @version	$Id: helper.php 18 2011-07-20 14:15:59Z ty2u $
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

class modDate2Helper {
	
	/** get time zone offset
	 * 
	 * @param string $zone
	 */
	function getZoneOffset($zone) {
		$a = new DateTimeZone($zone);
		$b = new DateTime("now", $a);
		$offset = $b->getOffset() / 3600;
		return $offset;
	}

	/** get custom separators
	 * 
	 * @param $name
	 * @param $params
	 */
	function getSeparator($name, &$params) {
		$custom = $params->get( $name );
		$preset = $params->get( $name . 'd' );
		
		// return custom if entered or return preset if set
		if(!empty($custom)) {
			if ($custom == "&#92;" || $custom == "\\")$custom = "&#92;";
			return $custom;
		} else if (!empty($preset)) {
			if ($preset == "&#92;" || $preset == "\\")$preset = "&#92;";
			return $preset;
		}
		
		// otherwise return nothing
		return;
	}
	
	/** converts a UTF8-string into HTML entities - thanx to silverbeat
	 * 
	 * @param string $utf8
	 * @param boolean $encodeTags
	 * @return converted HTML-string
	 */
	function utf8tohtml($utf8, $encodeTags) {
	    $result = '';
	    for ($i = 0; $i < strlen($utf8); $i++) {
	        $char = $utf8[$i];
	        $ascii = ord($char);
	        if ($ascii < 128) {
	            // one-byte character
	            $result .= ($encodeTags) ? htmlentities($char) : $char;
	        } else if ($ascii < 192) {
	            // non-utf8 character or not a start byte
	        } else if ($ascii < 224) {
	            // two-byte character
	            $result .= htmlentities(substr($utf8, $i, 2), ENT_QUOTES, 'UTF-8');
	            $i++;
	        } else if ($ascii < 240) {
	            // three-byte character
	            $ascii1 = ord($utf8[$i+1]);
	            $ascii2 = ord($utf8[$i+2]);
	            $unicode = (15 & $ascii) * 4096 +
	                       (63 & $ascii1) * 64 +
	                       (63 & $ascii2);
	            $result .= "&#$unicode;";
	            $i += 2;
	        } else if ($ascii < 248) {
	            // four-byte character
	            $ascii1 = ord($utf8[$i+1]);
	            $ascii2 = ord($utf8[$i+2]);
	            $ascii3 = ord($utf8[$i+3]);
	            $unicode = (15 & $ascii) * 262144 +
	                       (63 & $ascii1) * 4096 +
	                       (63 & $ascii2) * 64 +
	                       (63 & $ascii3);
	            $result .= "&#$unicode;";
	            $i += 3;
	        }
	    }
	    return $result;
	}
		
	/** show online count
	 * 
	 * @param $module
	 * @param $params
	 */
	function getOutput(&$module, &$params) {

		// import Joomla! date utility
		jimport('joomla.utilities.date');
		
		// store module parameters
		$cache	 				= $params->get( 'cache' );
		$compress	 			= $params->get( 'compress' );
		$moduleclass_sfx		= $params->get( 'moduleclass_sfx' );
		$showtime 				= $params->get( 'showtime' );
		$showdate 				= $params->get( 'showdate' );
		$pretext 				= $params->get( 'pretext' );
		$posttext 				= $params->get( 'posttext' );
		$method			 		= $params->get( 'method' );
		$predate 				= $params->get( 'predate' );
		$postdate 				= $params->get( 'postdate' );
		$pretime 				= $params->get( 'pretime' );
		$posttime 				= $params->get( 'posttime' );
		$order 					= $params->get( 'order' );
		$seplines				= $params->get( 'seplines' );
		$align					= $params->get( 'align' );
		$dateorder				= $params->get( 'dateorder', "w,d,m,y" );
		$suffixes 				= $params->get( 'suffixes' );
		$suntext 				= $params->get( 'suntext' );
		$montext 				= $params->get( 'montext' );
		$tuetext 				= $params->get( 'tuetext' );
		$wedtext 				= $params->get( 'wedtext' );
		$thutext 				= $params->get( 'thutext' );
		$fritext 				= $params->get( 'fritext' );
		$sattext 				= $params->get( 'sattext' );
		$monthformat 			= $params->get( 'monthformat' );
		$jantext 				= $params->get( 'jantext' );
		$febtext 				= $params->get( 'febtext' );
		$martext 				= $params->get( 'martext' );
		$aprtext 				= $params->get( 'aprtext' );
		$maytext 				= $params->get( 'maytext' );
		$juntext 				= $params->get( 'juntext' );
		$jultext 				= $params->get( 'jultext' );
		$augtext 				= $params->get( 'augtext' );
		$septext 				= $params->get( 'septext' );
		$octtext 				= $params->get( 'octtext' );
		$novtext 				= $params->get( 'novtext' );
		$dectext 				= $params->get( 'dectext' );
		$dst 					= $params->get( 'dst' );
		$ISO8601		 		= $params->get( 'ISO8601' );
		$useuserzone 			= $params->get( 'useuserzone' );
		$zone 					= $params->get( 'zone' );
		$phpzone 				= $params->get( 'phpzone' );
		$dston 					= $params->get( 'dston' );
		$dstoff 				= $params->get( 'dstoff' );
		$military 				= $params->get( 'military' );
		$hours 					= $params->get( 'hours' );
		$minutes 				= $params->get( 'minutes' );
		$seconds 				= $params->get( 'seconds' );
		$ampm 					= $params->get( 'ampm' );
		$amtext 				= $params->get( 'amtext' );
		$pmtext 				= $params->get( 'pmtext' );
		$d1 					= $params->get( 'd1' );
		$d2 					= $params->get( 'd2' );
		$d3 					= $params->get( 'd3' );
		$d4 					= $params->get( 'd4' );
		$d5 					= $params->get( 'd5' );
		$d6 					= $params->get( 'd6' );
		$d7 					= $params->get( 'd7' );
		$d8 					= $params->get( 'd8' );
		$d9 					= $params->get( 'd9' );
		$d10 					= $params->get( 'd10' );
		$d11 					= $params->get( 'd11' );
		$d12 					= $params->get( 'd12' );
		$d13 					= $params->get( 'd13' );
		$d14 					= $params->get( 'd14' );
		$d15 					= $params->get( 'd15' );
		$d16 					= $params->get( 'd16' );
		$d17 					= $params->get( 'd17' );
		$d18 					= $params->get( 'd18' );
		$d19 					= $params->get( 'd19' );
		$d20 					= $params->get( 'd20' );
		$d21 					= $params->get( 'd21' );
		$d22 					= $params->get( 'd22' );
		$d23 					= $params->get( 'd23' );
		$d24 					= $params->get( 'd24' );
		$d25 					= $params->get( 'd25' );
		$d26 					= $params->get( 'd26' );
		$d27 					= $params->get( 'd27' );
		$d28 					= $params->get( 'd28' );
		$d29 					= $params->get( 'd29' );
		$d30 					= $params->get( 'd30' );
		$d31 					= $params->get( 'd31' );
		$yearformat				= $params->get( 'yearformat' );
		$y0 					= $params->get( 'y0' );
		$y1 					= $params->get( 'y1' );
		$y2 					= $params->get( 'y2' );
		$y3 					= $params->get( 'y3' );
		$y4 					= $params->get( 'y4' );
		$y5 					= $params->get( 'y5' );
		$y6 					= $params->get( 'y6' );
		$y7 					= $params->get( 'y7' );
		$y8 					= $params->get( 'y8' );
		$y9 					= $params->get( 'y9' );
		
		$script_out = "";

		$script_out .= "			Date.prototype.stdTimezoneOffset = function() {
				var jan = new Date(this.getFullYear(), 0, 1);
				var jul = new Date(this.getFullYear(), 6, 1);
				return Math.max(jan.getTimezoneOffset(), jul.getTimezoneOffset());
			};
			Date.prototype.dst = function() {
				return this.getTimezoneOffset() < this.stdTimezoneOffset();
			};
";
		
		// get user time zone
		if ($useuserzone == "1") {
			$user =& JFactory::getUser();
			$userzone = $user->getParam('timezone');
			if (isset($userzone)) {
				$zone = $userzone;		
				$phpzone = $userzone;		
			}
		}

		// set alignment
		if($align == "1"){
			$alignment = "left";
		}
		if($align == "2"){
			$alignment = "center";
		}
		if($align == "3"){
			$alignment = "right";
		}
		// pre alignment output
		$align_out = array();
		if($align != "0"){
			$align_out[] = '<div style="margin:0px auto;width:auto;text-align:' . $alignment . ';">';
		}

		// variables to clean up the strings a bit
		$stripthis 	= array("\"\"","++++","+++","++","�");
		$addthis 	= array(""    ,"+"   ,"+"  ,"+" ," " );

		// javascript method
		if ($method == 0) {

			// include javascript in head tag
			$document = &JFactory::getDocument();
			$scriptpath = JURI::base() . 'modules' . DS . 'mod_date2' . DS . 'ty2udate.js';
			$document->addScript( $scriptpath );
						
			$theDate = "";

			// compile javascript date based on desired date order
			if ($showdate == 0) {
					
				// explode date order
				$exorder = explode(',', $dateorder);
		
				for ($i = 0; $i <= 3; $i++) {
				
					// check variable to prevent php notice - thanks to jonusc
					if (!isset($exorder[$i])) {
						break;
					}
		
					switch ($exorder[$i]) {
					case 'w':
						// make weekday with prefix and suffix
						if($i > 0){
							if ($exorder[$i-1] != "") {
								$theDate .= "+";
							}
						}
						$theDate .= "\"" . modDate2Helper::getSeparator('sepweek1', $params) . "\"+arday" . $module->id . "[myday" . $module->id . "]+\"" . modDate2Helper::getSeparator('sepweek2', $params) . "\"";
						if(count($exorder) < $i+1){
							if ($exorder[$i+1] != "") {
								$theDate .= "+";
							}
						}
						break;
					case 'd':
						// make day with prefix and suffix
						if($i > 0){
							if ($exorder[$i-1] != "") {
								$theDate .= "+";
							}
						}
						if ($suffixes == 0) {
							$theDate .= "\"" . modDate2Helper::getSeparator('sepday1', $params) . "\"+ardate" . $module->id . "[myweekday" . $module->id . "]+\"" . modDate2Helper::getSeparator('sepday2', $params) . "\"";
						} else {
							$theDate .= "\"" . modDate2Helper::getSeparator('sepday1', $params) . "\"+myweekday" . $module->id . "+\"" . modDate2Helper::getSeparator('sepday2', $params) . "\"";
						}
						if(count($exorder) < $i+1){
							if ($exorder[$i+1] != "") {
								$theDate .= "+";
							}
						}
						break;
					case 'm':
						// make month with prefix and suffix
						if($i > 0){
							if ($exorder[$i-1] != "") {
								$theDate .= "+";
							}
						}
						if ($monthformat == 0) {
							$theDate .= '"' . modDate2Helper::getSeparator('sepmonth1', $params) . '"+armonth' . $module->id . '[mymonth' . $module->id . ']+"' . modDate2Helper::getSeparator('sepmonth2', $params) . '"';
						} else {
							$theDate .= '"' . modDate2Helper::getSeparator('sepmonth1', $params) . '"+mymonth' . $module->id . '+"' . modDate2Helper::getSeparator('sepmonth2', $params) . '"';
						}
						if(count($exorder) < $i+1){
							if ($exorder[$i+1] != "") {
								$theDate .= "+";
							}
						}
						break;
					case 'y':
						// make year with prefix and suffix
						if($i > 0){
							if ($exorder[$i-1] != "") {
								$theDate .= "+";
							}
						}

						if ($yearformat == 0) {
						
							// javascript function to check year for replacements
							$string = '
			function checkYear(matchedSubstring, Index, OriginalString) {

				switch(matchedSubstring) {
				case "0":
					return "_y0_";
					break;
				case "1":
					return "_y1_";
					break;
				case "2":
					return "_y2_";
					break;
				case "3":
					return "_y3_";
					break;
				case "4":
					return "_y4_";
					break;
				case "5":
					return "_y5_";
					break;
				case "6":
					return "_y6_";
					break;
				case "7":
					return "_y7_";
					break;
				case "8":
					return "_y8_";
					break;
				case "9":
					return "_y9_";
					break;
				default:
					return matchedSubstring;
					break;
				};
			};
							';
							
							$patterns = array();
							$patterns[0] = '/_y0_/';
							$patterns[1] = '/_y1_/';
							$patterns[2] = '/_y2_/';
							$patterns[3] = '/_y3_/';
							$patterns[4] = '/_y4_/';
							$patterns[5] = '/_y5_/';
							$patterns[6] = '/_y6_/';
							$patterns[7] = '/_y7_/';
							$patterns[8] = '/_y8_/';
							$patterns[9] = '/_y9_/';
							$replacements = array();
							$replacements[0] = $y0;
							$replacements[1] = $y1;
							$replacements[2] = $y2;
							$replacements[3] = $y3;
							$replacements[4] = $y4;
							$replacements[5] = $y5;
							$replacements[6] = $y6;
							$replacements[7] = $y7;
							$replacements[8] = $y8;
							$replacements[9] = $y9;
							$script_out .= preg_replace($patterns, $replacements, $string);
							
							$theDate .= "\"" . modDate2Helper::getSeparator('sepyear1', $params) . "\"+year" . $module->id . "+\"" . modDate2Helper::getSeparator('sepyear2', $params) . "\"";							
						} else {
							$theDate .= "\"" . modDate2Helper::getSeparator('sepyear1', $params) . "\"+year" . $module->id . "+\"" . modDate2Helper::getSeparator('sepyear2', $params) . "\"";
						}
						if(count($exorder) < $i+1){
							if ($exorder[$i+1]!="") {
								$theDate .= "+";
							}
						}
						break;
					default:
						$theDate .= "\"\"";
					}
				}

				// clean up strings
				$theDate 	= str_replace($stripthis, $addthis, $theDate);
				$theDate 	= trim($theDate, "+");
		
				// add suffix
				$theDate	= $theDate . "+\"" . $postdate . "\"";
			}
		
			$theTime = "";
		
			// compile javascript time based on paramaters
			if ($showtime==0) {
				if ($hours==0) {
					$theTime .= "\"" . modDate2Helper::getSeparator('sephour1', $params) . "\"+myhours" . $module->id . "+\"" . modDate2Helper::getSeparator('sephour2', $params) . "\"";
				}
				if ($minutes==0) {
					$theTime .= "\"" . modDate2Helper::getSeparator('sepminute1', $params) . "\"+mytime" . $module->id . "+\"" . modDate2Helper::getSeparator('sepminute2', $params) . "\"";
				}
				if ($seconds==0) {
					$theTime .= "\"" . modDate2Helper::getSeparator('$sepsecond2', $params) . "\"+myseconds" . $module->id . "+\"" . modDate2Helper::getSeparator('sepsecond2', $params) . "\"";
				}
				if ($ampm==0 && $military==1) {
					$theTime .= "\"" . modDate2Helper::getSeparator('sepampm1', $params) . "\"+mm" . $module->id . "+\"" . modDate2Helper::getSeparator('sepampm2', $params) . "\"";
				}
		
				// clean up strings
				$theTime 	= str_replace($stripthis, $addthis, $theTime);
				$theTime 	= trim($theTime, "+");
		
				// add suffix
				$theTime	= $theTime . "+\"" . $posttime . "\"";
			}			

			$string = '
			function ISO8601Local_MODULE_ID_(date) {
			// handles years from 0000 to 9999 only
				var offset_MODULE_ID_ = date.getTimezoneOffset();
				var offsetSign_MODULE_ID_ = "-";
				if (offset_MODULE_ID_ <= 0) {
					offsetSign_MODULE_ID_ = "+";
					offset_MODULE_ID_ = -offset_MODULE_ID_;
				};
				var offsetHours_MODULE_ID_ = Math.floor(offset_MODULE_ID_ / 60);
				var offsetMinutes_MODULE_ID_ = offset_MODULE_ID_ - offsetHours_MODULE_ID_ * 60;
				return ("000" + date.getFullYear()).slice(-4) +
				"-" + ("0" + (date.getMonth() + 1)).slice(-2) +
				"-" + ("0" + date.getDate()).slice(-2) +
				"T" + ("0" + date.getHours()).slice(-2) +
				":" + ("0" + date.getMinutes()).slice(-2) +
				":" + ("0" + date.getSeconds()).slice(-2) +
				"," + ("00" + date.getMilliseconds()).slice(-3) +
				offsetSign_MODULE_ID_ + ("0" + offsetHours_MODULE_ID_).slice(-2) +
				":" + ("0" + offsetMinutes_MODULE_ID_).slice(-2);
			};
		
			var ISO8601_MODULE_ID_ = "_ISO8601_";
		
			function clock_MODULE_ID_() {
				var newdate_MODULE_ID_ = new Date();
		
				if(ISO8601_MODULE_ID_ == "1") {
		
					var time_MODULE_ID_ = ISO8601Local_MODULE_ID_(newdate_MODULE_ID_);
		
				} else {
		
					var day_MODULE_ID_="";
					var month_MODULE_ID_="";
					var myweekday_MODULE_ID_="";
					var year_MODULE_ID_="";
					var mydate_MODULE_ID_ = new Date();
					var dston_MODULE_ID_  = new Date("_dston_");
					var dstoff_MODULE_ID_ = new Date("/_dstoff_");
					dston_MODULE_ID_.setFullYear(newdate_MODULE_ID_.getFullYear());
					dstoff_MODULE_ID_.setFullYear(newdate_MODULE_ID_.getFullYear());
		
					var dst_MODULE_ID_ = "_dst_";
					var myzone_MODULE_ID_ = newdate_MODULE_ID_.getTimezoneOffset();
		
					var zone_MODULE_ID_ = parseInt(_zone_);
					
					// zone is negative so convert to positive to do calculations
					if (zone_MODULE_ID_ <= 0) {
						zoneb_MODULE_ID_ = -zone_MODULE_ID_;
					} else {
						zoneb_MODULE_ID_ = zone_MODULE_ID_;
					};
					if (mydate_MODULE_ID_ > dston_MODULE_ID_ && mydate_MODULE_ID_ < dstoff_MODULE_ID_ && dst_MODULE_ID_ == "1") {
					//date is between dst dates and dst adjust is on.
						zonea_MODULE_ID_ = zoneb_MODULE_ID_ - 1;
						var houradjust_MODULE_ID_ = 0;
					} else {
						zonea_MODULE_ID_ = zoneb_MODULE_ID_;
						var houradjust_MODULE_ID_ = -1;
					};
		
					newtime_MODULE_ID_=newdate_MODULE_ID_.getTime();
		
					var newzone_MODULE_ID_ =  (zonea_MODULE_ID_*60*60*1000);
		
					// convert zone back to negative if it was negative originally
					if (zone_MODULE_ID_ <= 0) {
						newzone_MODULE_ID_ = -newzone_MODULE_ID_;
					};
					newtimea_MODULE_ID_ = newtime_MODULE_ID_+(myzone_MODULE_ID_*60*1000)+newzone_MODULE_ID_;
		
					mydate_MODULE_ID_.setTime(newtimea_MODULE_ID_);
					myday_MODULE_ID_ = mydate_MODULE_ID_.getDay();
					mymonth_MODULE_ID_ = mydate_MODULE_ID_.getMonth();
					myweekday_MODULE_ID_= mydate_MODULE_ID_.getDate();
					myyear_MODULE_ID_= mydate_MODULE_ID_.getYear();
					year_MODULE_ID_ = myyear_MODULE_ID_;
		
					if (year_MODULE_ID_ < 2000) year_MODULE_ID_ = year_MODULE_ID_ + 1900;
					myhours_MODULE_ID_ = mydate_MODULE_ID_.getHours();
';
			
			// immediate replace variables
			$patterns = array();
			$patterns[0] = '/_MODULE_ID_/';
			$patterns[1] = '/_ISO8601_/';
			$patterns[2] = '/_dston_/';
			$patterns[3] = '/_dstoff_/';
			$patterns[4] = '/_dst_/';
			$patterns[5] = '/_zone_/';
			$replacements = array();
			$replacements[0] = $module->id;
			$replacements[1] = $ISO8601;
			$replacements[2] = $dston;
			$replacements[3] = $dstoff;
			$replacements[4] = $dst;
			$replacements[5] = modDate2Helper::getZoneOffset($zone);
			$script_out .= preg_replace($patterns, $replacements, $string);

			// not using military time
			if ($military == "1") {
			
				$string = '
					var mm_MODULE_ID_ = "_amtext_";
					if (myhours_MODULE_ID_ > 12 + houradjust_MODULE_ID_)
						mm_MODULE_ID_ = "_pmtext_";
					if (myhours_MODULE_ID_ > 12 + houradjust_MODULE_ID_)
						myhours_MODULE_ID_ -= 12;
					if (myhours_MODULE_ID_ == 0) myhours_MODULE_ID_ = 12;
';
				$patterns = array();
				$patterns[0] = '/_MODULE_ID_/';
				$patterns[1] = '/_amtext_/';
				$patterns[2] = '/_pmtext_/';
				$replacements = array();
				$replacements[0] = $module->id;
				$replacements[1] = $amtext;
				$replacements[2] = $pmtext;
				$script_out .= preg_replace($patterns, $replacements, $string);
	
			// using military time
			}else{
			
				$string = '
						if (myhours_MODULE_ID_ < 10) {
							myhours_MODULE_ID_ = "0" + myhours_MODULE_ID_;
						} else {
							myhours_MODULE_ID_ = "" + myhours_MODULE_ID_;
						};
';
				$patterns = array();
				$patterns[0] = '/_MODULE_ID_/';
				$replacements = array();
				$replacements[0] = $module->id;
				$script_out .= preg_replace($patterns, $replacements, $string);
				
			}
			
			$string = '
					myminutes_MODULE_ID_ = mydate_MODULE_ID_.getMinutes();
		
					if (myminutes_MODULE_ID_ < 10) {
						mytime_MODULE_ID_ = "0" + myminutes_MODULE_ID_;
					} else {
						mytime_MODULE_ID_ = "" + myminutes_MODULE_ID_;
					};
		
					myseconds_MODULE_ID_ = mydate_MODULE_ID_.getSeconds();
		
					if (myseconds_MODULE_ID_ < 10) {
						myseconds_MODULE_ID_ = "0" + myseconds_MODULE_ID_;
					} else {
						myseconds_MODULE_ID_ = "" + myseconds_MODULE_ID_;
					};
		
					arday_MODULE_ID_ = new Array("_suntext_","_montext_","_tuetext_","_wedtext_","_thutext_","_fritext_","_sattext_");
					armonth_MODULE_ID_ = new Array("_jantext_","_febtext_","_martext_","_aprtext_","_maytext_","_juntext_","_jultext_","_augtext_","_septext_", "_octtext_","_novtext_","_dectext_");
					ardate_MODULE_ID_ = new Array("0th","_d1_","_d2_","_d3_","_d4_","_d5_","_d6_","_d7_","_d8_","_d9_","_d10_","_d11_","_d12_","_d13_","_d14_","_d15_","_d16_","_d17_","_d18_","_d19_","_d20_","_d21_","_d22_","_d23_","_d24_","_d25_","_d26_","_d27_","_d28_","_d29_","_d30_","_d31_");
					';
			$patterns = array();
			$patterns[0] = '/_MODULE_ID_/';
			$patterns[1] = '/_suntext_/';
			$patterns[2] = '/_montext_/';
			$patterns[3] = '/_tuetext_/';
			$patterns[4] = '/_wedtext_/';
			$patterns[5] = '/_thutext_/';
			$patterns[6] = '/_fritext_/';
			$patterns[7] = '/_sattext_/';
			$patterns[8] = '/_jantext_/';
			$patterns[9] = '/_febtext_/';
			$patterns[10] = '/_martext_/';
			$patterns[11] = '/_aprtext_/';
			$patterns[12] = '/_maytext_/';
			$patterns[13] = '/_juntext_/';
			$patterns[14] = '/_jultext_/';
			$patterns[15] = '/_augtext_/';
			$patterns[16] = '/_septext_/';
			$patterns[17] = '/_octtext_/';
			$patterns[18] = '/_novtext_/';
			$patterns[19] = '/_dectext_/';
			$patterns[20] = '/_d1_/';
			$patterns[21] = '/_d2_/';
			$patterns[22] = '/_d3_/';
			$patterns[23] = '/_d4_/';
			$patterns[24] = '/_d5_/';
			$patterns[25] = '/_d6_/';
			$patterns[26] = '/_d7_/';
			$patterns[27] = '/_d8_/';
			$patterns[28] = '/_d9_/';
			$patterns[29] = '/_d10_/';
			$patterns[30] = '/_d11_/';
			$patterns[31] = '/_d12_/';
			$patterns[32] = '/_d13_/';
			$patterns[33] = '/_d14_/';
			$patterns[34] = '/_d15_/';
			$patterns[35] = '/_d16_/';
			$patterns[36] = '/_d17_/';
			$patterns[37] = '/_d18_/';
			$patterns[38] = '/_d19_/';
			$patterns[39] = '/_d20_/';
			$patterns[40] = '/_d21_/';
			$patterns[41] = '/_d22_/';
			$patterns[42] = '/_d23_/';
			$patterns[43] = '/_d24_/';
			$patterns[44] = '/_d25_/';
			$patterns[45] = '/_d26_/';
			$patterns[46] = '/_d27_/';
			$patterns[47] = '/_d28_/';
			$patterns[48] = '/_d29_/';
			$patterns[49] = '/_d30_/';
			$patterns[50] = '/_d31_/';
			$replacements = array();
			$replacements[0] = $module->id;
			$replacements[1] = $suntext;
			$replacements[2] = $montext;
			$replacements[3] = $tuetext;
			$replacements[4] = $wedtext;
			$replacements[5] = $thutext;
			$replacements[6] = $fritext;
			$replacements[7] = $sattext;
			$replacements[8] = $jantext;
			$replacements[9] = $febtext;
			$replacements[10] = $martext;
			$replacements[11] = $aprtext;
			$replacements[12] = $maytext;
			$replacements[13] = $juntext;
			$replacements[14] = $jultext;
			$replacements[15] = $augtext;
			$replacements[16] = $septext;
			$replacements[17] = $octtext;
			$replacements[18] = $novtext;
			$replacements[19] = $dectext;
			$replacements[20] = $d1;
			$replacements[21] = $d2;
			$replacements[22] = $d3;
			$replacements[23] = $d4;
			$replacements[24] = $d5;
			$replacements[25] = $d6;
			$replacements[26] = $d7;
			$replacements[27] = $d8;
			$replacements[28] = $d9;
			$replacements[29] = $d10;
			$replacements[30] = $d11;
			$replacements[31] = $d12;
			$replacements[32] = $d13;
			$replacements[33] = $d14;
			$replacements[34] = $d15;
			$replacements[35] = $d16;
			$replacements[36] = $d17;
			$replacements[37] = $d18;
			$replacements[38] = $d19;
			$replacements[39] = $d20;
			$replacements[40] = $d21;
			$replacements[41] = $d22;
			$replacements[42] = $d23;
			$replacements[43] = $d24;
			$replacements[44] = $d25;
			$replacements[45] = $d26;
			$replacements[46] = $d27;
			$replacements[47] = $d28;
			$replacements[48] = $d29;
			$replacements[49] = $d30;
			$replacements[50] = $d31;
			$script_out .= preg_replace($patterns, $replacements, $string);
		
			// add prefixes and a line break if they are wanted
	
			if ($showdate == 0 && !empty($dateorder)) {
				$datebreak = "";
				if ($seplines == 0 && $order == 1) $datebreak = "<br />";
				$predate = "\"" . $datebreak . $predate . "\"+";
			}else{
				$predate = "";
			}
	
			if ($showtime == 0) {
				$timebreak = "";
				if ($seplines == 0 && $order == 0) $timebreak = "<br />";
				$pretime = "\"" . $timebreak . $pretime . "\"+";
			}else{
				$pretime = "";
			}
	
			// adjust some date values if required
			if ($suffixes == 1) {
			
				$string = '
				myweekday_MODULE_ID_ = parseInt(myweekday_MODULE_ID_);';
				$patterns = array();
				$patterns[0] = '/_MODULE_ID_/';
				$replacements = array();
				$replacements[0] = $module->id;
				$script_out .= preg_replace($patterns, $replacements, $string);
			
			}
			if ($monthformat == 1) {
			
				$string = '
				mymonth_MODULE_ID_ = parseInt(mymonth_MODULE_ID_)+1;';
				$patterns = array();
				$patterns[0] = '/_MODULE_ID_/';
				$replacements = array();
				$replacements[0] = $module->id;
				$script_out .= preg_replace($patterns, $replacements, $string);
				
			}
			
			// check the year if using text display
			if ($yearformat == 0) {
	
				$string = '
				var replaceyear = String(year_MODULE_ID_);
				year_MODULE_ID_ = replaceyear.replace(/\d/g, checkYear);
				';
				
				$patterns = array();
				$patterns[0] = '/_MODULE_ID_/';
				$replacements = array();
				$replacements[0] = $module->id;
				$script_out .= preg_replace($patterns, $replacements, $string);
			
			}
			
			// date should be shown first
			if ($order == 0 && ($showdate == 0 || $showtime == 0)) {
	
				if(!empty($theTime) && $showdate == 0) {
					$theDate .= "+";
				}
				
				$string = '
				var time_MODULE_ID_ = (_predate__theDate__pretime__theTime_);';
				$patterns = array();
				$patterns[0] = '/_MODULE_ID_/';
				$patterns[1] = '/_predate_/';
				$patterns[2] = '/_theDate_/';
				$patterns[3] = '/_pretime_/';
				$patterns[4] = '/_theTime_/';
				$replacements = array();
				$replacements[0] = $module->id;
				$replacements[1] = $predate;
				$replacements[2] = $theDate;
				$replacements[3] = $pretime;
				$replacements[4] = $theTime;
				$script_out .= preg_replace($patterns, $replacements, $string);

			// time should be shown first
			} elseif ($order == 1 && ($showdate == 0 || $showtime == 0)) {
	
				if(!empty($theDate) && $showtime == 0) {
					$theTime .= "+";
				}
					
				$string = "
									var time_MODULE_ID_ = (_pretime__theTime__predate__theDate_);";
				$patterns = array();
				$patterns[0] = '/_MODULE_ID_/';
				$patterns[1] = '/_predate_/';
				$patterns[2] = '/_theDate_/';
				$patterns[3] = '/_pretime_/';
				$patterns[4] = '/_theTime_/';
				$replacements = array();
				$replacements[0] = $module->id;
				$replacements[1] = $predate;
				$replacements[2] = $theDate;
				$replacements[3] = $pretime;
				$replacements[4] = $theTime;
				$script_out .= preg_replace($patterns, $replacements, $string);
		
			}
			
			$string = '
					};
					
					document.getElementById("ty2udate_MODULE_ID_").innerHTML  = time_MODULE_ID_;
		
					setTimeout("clock_MODULE_ID_()", 1000);
		
			};
			listen("load", window, clock_MODULE_ID_);
';
			$patterns = array();
			$patterns[0] = '/_MODULE_ID_/';
			$replacements = array();
			$replacements[0] = $module->id;
			$script_out .= preg_replace($patterns, $replacements, $string);
			
		}
		
		// PHP method
		
		// reset params
		$predate 				= $params->get( 'predate' );
		$postdate 				= $params->get( 'postdate' );
		$pretime 				= $params->get( 'pretime' );
		$posttime 				= $params->get( 'posttime' );

		// ISO 8601 format
		if($ISO8601 == 1) {

			if($phpzone < 0){
				$time = date("c", strtotime($phpzone . " hours"));
			} else if ($phpzone > 0) {
				$time = date("c", strtotime("+" . $phpzone . " hours"));
			} else if ($phpzone == 0) {
				$time = date("c");
			}

		} else {
		// user defined format
		
			// adjust for DST
			if (date("I") && $dst == "1") {
					$phpzone++;
			}
			
/* TODO fix this thing
if (date_default_timezone_get()) {
    echo 'date_default_timezone_set: ' . date_default_timezone_get() . '<br />';
}

if (ini_get('date.timezone')) {
    echo 'date.timezone: ' . ini_get('date.timezone');
}

date_default_timezone_set('America/Toronto');

$script_tz = date_default_timezone_get();

if (strcmp($script_tz, ini_get('date.timezone'))){
    echo 'Script timezone differs from ini-set timezone.';
} else {
    echo 'Script timezone and ini-set timezone match.';
}

$localtime = localtime();
$localtime_assoc = localtime(time(), true);
print_r($localtime);
print_r($localtime_assoc);
			jexit();
*/
			
			// time adjustment
			if($phpzone < 0){
				if ($military == "1") {
					$parts = date("w,j,m,Y,g,i,s", strtotime($phpzone." hours"));
				}else{
					$parts = date("w,j,m,Y,H,i,s", strtotime($phpzone." hours"));
				}
			} else if ($phpzone > 0) {
				if ($military == "1") {
					$parts = date("w,j,m,Y,g,i,s", strtotime("+".$phpzone." hours"));
				}else{
					$parts = date("w,j,m,Y,H,i,s", strtotime("+".$phpzone." hours"));
				}
			} else if ($phpzone == 0) {
				if ($military == "1") {
					$parts = date("w,j,m,Y,g,i,s");
				}else{
					$parts = date("w,j,m,Y,H,i,s");
				}
			}

			// explode parts after adjustments
			$parts = explode(",", $parts);

			$weekday 	= $parts[0];
			$day 		= $parts[1];
			$month 		= $parts[2];
			$year 		= $parts[3];
			$hour 		= $parts[4];
			$minute 	= $parts[5];
			$second 	= $parts[6];

			// text arrays
			$daytext = array($suntext,$montext,$tuetext,$wedtext,$thutext,$fritext,$sattext);
			$suffixtext = array("0th",$d1,$d2,$d3,$d4,$d5,$d6,$d7,$d8,$d9,$d10,$d11,$d12,$d13,$d14,$d15,$d16,$d17,$d18,$d19,$d20,$d21,$d22,$d23,$d24,$d25,$d26,$d27,$d28,$d29,$d30,$d31);
			$monthtext = array($jantext,$febtext,$martext,$aprtext,$maytext,$juntext,$jultext,$augtext,$septext,$octtext,$novtext,$dectext);
			$yeartext = array($y0,$y1,$y2,$y3,$y4,$y5,$y6,$y7,$y8,$y9);
			
			// add prefixes and a line break if they are wanted
			if ($showdate == 0 && !empty($dateorder)) {
				$datebreak = "";
				if ($seplines == 0 && $order == 1) {
						$datebreak = "<br />";
					}
					$predate = $datebreak . $predate;
			}else{
				$predate = "";
			}
			if ($showtime == 0) {
					$timebreak = "";
					if ($seplines == 0 && $order == 0) {
						$timebreak = "<br />";
					}
					$pretime = $timebreak . $pretime;
			}else{
				$pretime = "";
			}

			// adjust month if using text
			if ($monthformat == 0) {
				$month = intval($month)-1;
			}

			// compile php date based on desired date order
			$theDate = "";
			if ($showdate == 0) {

				// explode date order
				$exorder = explode(",", $dateorder);

				for ($i = 0; $i <= 3; $i++) {
					switch ($exorder[$i]) {
					case 'w':
						// make weekday with prefix and suffix
						$theDate .= modDate2Helper::getSeparator('sepweek1', $params) . $daytext[$weekday] . modDate2Helper::getSeparator('sepweek2', $params);
						break;
					case 'd':
						// make day with prefix and suffix
						if ($suffixes == 0) {
							$theDate .= modDate2Helper::getSeparator('sepday1', $params).$suffixtext[$day].modDate2Helper::getSeparator('sepday2', $params);
						}else {
							$theDate .= modDate2Helper::getSeparator('sepday1', $params).$day.modDate2Helper::getSeparator('sepday2', $params);
						}
						break;
					case 'm':
						// make month with prefix and suffix
						if ($monthformat == 0) {
							$theDate .= modDate2Helper::getSeparator('sepmonth1', $params) . $monthtext[$month] . modDate2Helper::getSeparator('sepmonth2', $params);
						}else {
							$theDate .= modDate2Helper::getSeparator('sepmonth1', $params) . $month . modDate2Helper::getSeparator('sepmonth2', $params);
						}
						break;
					case 'y':
						// make year with prefix and suffix
						
						if ($yearformat == 0) {
	
							$patterns = array();
							$patterns[0] = '/0/';
							$patterns[1] = '/1/';
							$patterns[2] = '/2/';
							$patterns[3] = '/3/';
							$patterns[4] = '/4/';
							$patterns[5] = '/5/';
							$patterns[6] = '/6/';
							$patterns[7] = '/7/';
							$patterns[8] = '/8/';
							$patterns[9] = '/9/';
							$replacements = array();
							$replacements[0] = $y0;
							$replacements[1] = $y1;
							$replacements[2] = $y2;
							$replacements[3] = $y3;
							$replacements[4] = $y4;
							$replacements[5] = $y5;
							$replacements[6] = $y6;
							$replacements[7] = $y7;
							$replacements[8] = $y8;
							$replacements[9] = $y9;
							$year_out = preg_replace($patterns, $replacements, $year);				
							
							$theDate .= modDate2Helper::getSeparator('sepyear1', $params);
							$theDate .= $year_out;
							$theDate .= modDate2Helper::getSeparator('sepyear2', $params);
						} else {
							$theDate .= modDate2Helper::getSeparator('sepyear1', $params).$year.modDate2Helper::getSeparator('sepyear2', $params);
						}
						break;
					default:
						$theDate .= "";
					}
				}
			}

			$theTime = "";
			
			// compile php time based on paramaters
			if ($showtime == 0) {
				if ($hours == 0) {
					$theTime .= modDate2Helper::getSeparator('sephour1', $params) . $hour . modDate2Helper::getSeparator('sephour2', $params);
				}
				if ($minutes == 0) {
					$theTime .= modDate2Helper::getSeparator('sepminute1', $params) . $minute . modDate2Helper::getSeparator('sepminute2', $params);
				}
				if ($seconds == 0) {
					$theTime .= modDate2Helper::getSeparator('$sepsecond2', $params) . $second . modDate2Helper::getSeparator('sepsecond2', $params);
				}
				if ($ampm == 0 && $military == 1) {
					if (date("a")=="am") {
						$theTime .= modDate2Helper::getSeparator('sepampm1', $params) . $amtext . modDate2Helper::getSeparator('sepampm2', $params);
					}else{
						$theTime .= modDate2Helper::getSeparator('sepampm1', $params) . $pmtext . modDate2Helper::getSeparator('sepampm2', $params);
					}
				}
			}

			$time = "";

			// date should be shown first
			if ($order == 0) {

				if(!empty($theDate)) {
					$theDate .= "";
				}

				if ($showdate == 0) {
					$time .= $predate . $theDate . $postdate;
				}
				if ($showtime == 0) {
					$time .= $pretime . $theTime . $posttime;
				}

			// time should be shown first
			} else {

				if(!empty($theTime)) {
					$theTime .= "";
				}

				if ($showtime == 0) {
					$time .= $pretime . $theTime . $posttime;
				}
				if ($showdate == 0) {
					$time .= $predate . $theDate . $postdate;
				}
			}
		}

		// clean up strings
		$time 	= str_replace($stripthis, $addthis, $time);
		$time 	= trim($time, "+");

		$php_output = $time;
		
		// post alignment output
		if($align != "0"){
			$align_out[] = "</div>";
		}
		
		// output javascript - javascript method
		if (isset($script_out)) {

			// compress javascript output
			if ($compress > 0) {
				// compress javascript output
				require_once (dirname(__FILE__).DS.'class.JavaScriptPacker.php');
				$packer = new JavaScriptPacker($script_out, $compress, false, false);
				$script_out = $packer->pack();	
			}
			
			// if caching is on don't do anything and output script on the spot		
			// also check if Joomla cache is enabled in global config
			$conf = JFactory::getConfig();
			if ($cache == "1" && $conf->get('caching') >= 1) {
				echo '<script type="text/javascript">' . $script_out . '</script>';
			} else {
				// caching is disabled so put javascript in head tag
				$document = &JFactory::getDocument();
				$document->addScriptDeclaration( $script_out );
			}
			
		}
		
		// return PHP output so we can fall back to something if Javascript is disabled

		// check for alignment
		if ($align != "0") {
			$php_output = $align_out[0] . $php_output . $align_out[1];
		}
		return $php_output;	
	}
}
?>