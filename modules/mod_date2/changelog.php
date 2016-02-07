<?php
/**
 * @version	$Id: changelog.php 18 2011-07-20 14:15:59Z ty2u $
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
?>

TODO
- Test if it must auto detect client DST with javascript method for zones that don't use DST
	http://javascript.about.com/library/bldst.htm
	How to make it work for other time zones... will it work?  or will it just use the time zone the user sets.
	Report that +3 must be used when only should be +1 when auto is on
- make php detect difference between php time zone param and server time and adjust time accordingly 
- add support for other date formats that joomla supports in date lib, and possibly others
- add default settings to language and manual for each param
- add flash generation method
- html5 support?
- ajax method as well?
- add option to switch to a graphical clock display
- add option to turn off all bloat and output simple date and time using Joomla API
**Updated online manual to be a bit clearer and integrated it into the params

#s are issue numbers on http://dev.ty2u.com/dateandtime

Changelog
2.2beta2 - 20 July 2011
Works with Joomla 1.7
#1 Possible fix for this PM text issue
Fix missing slash when loading javascript file
#11 Added CSS Styles param under Display Options
#11 Added WYSIWYG editors to pre-text and post-text params
Fixed description when installing
Removed some extra fields files

2.2beta1 - 28 April 2011
Now works with Joomla 1.6 and not Joomla 1.5
Added Joomla 1.6 update functionality
Added Javascript DST detection methods from http://javascript.about.com/library/bldst.htm
Removed alert from ty2udate.js - thanks zami1
Added parseInt fix to zone - thanks zami1
Moved changelog from website to changelog.php
Added cache param
	-will also check if global cache is enabled 
	-javascript will go be placed within <head> tag if no cache is enabled
Revamped parameters
Restructured all the code
Made module install as upgradeable
Added language file
Added javascript compression parameter
	- uses the php version of the Dean Edwards JavaScript's Packer http://joliclic.free.fr/php/javascript-packer/en/
Will now use PHP method if javascript is disabled in visitors browser
Can set a separate time zone offset for PHP and Javascript
	-you should set PHP offset properly as well even if using JS generation method
Can optionally use a logged in users time offset from their user profile - you must logout and log back in to see changes
Added a drop down for common separators, including a space, for each separator and a custom override box
Added BR tag to separator presets
Added ability to change characters in the year

2.1.8 - 21 Nov 2009
Fixed bug with the order of the code.  Thanks to moderntalking on the forums!

2.1.7 - 29 Sept 2009
Fixed error when trying to show only the date
Removed another PHP notice - thanks to jonusc

2.1.6 - 25 Aug 2009
I released the wrong files early this morning because apparently it didn't work properly in every case, sorry!
Removed PHP notices

2.1.5 - 11 June 2009
Fixed spaces turning into weird symbols - will still save in the params as weird symbols but will be replaced by a space on output
Added support for multiple instances of the module

2.1.4 - 3 April 2009
Fixed time zone issue where a positive value entered would work as a negative value
Now requires Joomla 1.5

2.1.3 - 31st May 2008
31st day now shows correctly

2.1.2
Fixed bug where it would show am/pm opposite at the 11th hour

2.1.1
Fixed bug where it would show blank day on 10th of each month

2.1
Fixed some bugs with time zones
Added ability to change Daylight Savings Time / Summer Time
Added ability to use ISO 8601 date format.
Added language support for days of the month.
Added alignment.

2.0
Added tons of features.
No longer uses Joomla function to get the date.