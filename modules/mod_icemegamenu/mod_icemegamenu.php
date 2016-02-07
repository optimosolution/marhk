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
defined('_JEXEC') or die;
/* Include the syndicate functions only once*/
require_once dirname(__FILE__).DS.'helper.php';

$config_js_path = JPATH_SITE.DS.'modules'.DS.'mod_icemegamenu'.DS.'tmpl'.DS.'js_config.php';

/*Menu setting*/
$params->def('menutype', 			'mainmenu');
$params->def('class_sfx', 			'');
$params->def('menu_images', 		0);
$params->def('menu_images_align', 	0);
$params->def('expand_menu', 		0);
$params->def('activate_parent', 	0);
$params->def('indent_image', 		0);
$params->def('indent_image1', 		'indent1.png');
$params->def('indent_image2', 		'indent2.png');
$params->def('indent_image3', 		'indent3.png');
$params->def('indent_image4', 		'indent4.png');
$params->def('indent_image5', 		'indent5.png');
$params->def('indent_image6', 		'indent.png');
$params->def('spacer', 				'');
$params->def('end_spacer', 			'');
$params->def('full_active_id', 		0);

/* Added in 1.5 */
$params->def('startLevel', 			0);
$params->def('endLevel', 			0);
$params->def('showAllChildren', 	0);

/*Mega menu settings */
$activate_action 	= $params->get("activate_action", "mouseover");
$deactivate_action 	= $params->get("deactivate_action", "mouseleave");
$js_effect 			= $params->get("js_effect", "slide & fade");

$js_duration 	= $params->get("js_duration", 600);
$js_physics 	= $params->get("js_physics", "Fx.Transitions.Pow.easeOut");
$js_hideDelay 	= $params->get("js_hideDelay", 1000);
$js_opacity 	= $params->get("js_opacity", 95);
$use_js 		= $params->get("use_js", 1);

/*load theme*/
$layoutModulePath 	= JModuleHelper::getLayoutPath($module->module);
$icemegamenu 		= new modIceMegamenuHelper($module, $params);

require($layoutModulePath);

?>