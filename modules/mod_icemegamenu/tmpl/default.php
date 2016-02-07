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
 
 
$icemegamenu->render($params, 'modIceMegaMenuXMLCallback');

if($use_js):
?>  
<script type="text/javascript">
    window.addEvent('domready', function() {    
		if(document.getElementById('icemegamenu')!= null)
		var myMenu = new MenuMatic({id:'icemegamenu',
			subMenusContainerId: 'subMenusContainer',
			effect:'<?php echo $js_effect;?>',
			duration:<?php echo $js_duration;?>,
			physics:<?php echo $js_physics;?>,
			hideDelay:<?php echo $js_hideDelay;?>,
			opacity:<?php echo $js_opacity;?>                                            
		});
    });
</script>
<?php
 endif;
?>