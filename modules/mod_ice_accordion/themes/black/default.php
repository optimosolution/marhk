<?php
/**
 * IceAccordion Extension for Joomla 1.6 By IceTheme
 * 
 * 
 * @copyright	Copyright (C) 2008 - 2011 IceTheme.com. All rights reserved.
 * @license		GNU General Public License version 2
 * 
 * @Website 	http://www.icetheme.com/Joomla-Extensions/iceaccordion.html
 * @Support 	http://www.icetheme.com/Forums/IceAccordion/
 *
 */
 

/* no direct access*/
defined('_JEXEC') or die;
?>
<div  id="iceaccordion<?php echo $module->id;?>">
	<div  class="iceaccordion iceaccordion-theme-black">
		<?php require_once $item_path; ?>
	</div>
	<div class="iceaccordion-hidden">
	</div>
	<?php echo $paging ;?>
</div>