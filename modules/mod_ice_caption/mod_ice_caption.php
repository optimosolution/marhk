<?php
/*---------------------------------------------------------------- 
  Copyright:
 (C) 2008 - 2010 IceTheme
  
  License:
  GNU/GPL http://www.gnu.org/copyleft/gpl.html
  
  Author:
  IceTheme - http://wwww.icetheme.com
---------------------------------------------------------------- */
require_once JPATH_SITE.DS.'components'.DS.'com_content'.DS.'helpers'.DS.'route.php';
if(!defined('PhpThumbFactoryLoaded'))
{
	require_once dirname(__FILE__).DS.'libs'.DS.'phpthumb'.DS.'ThumbLib.inc.php';
	define('PhpThumbFactoryLoaded',1);
}
if(!class_exists('LofSliderGroupBase'))
{
	require_once(dirname(__FILE__).DS.'libs'.DS.'group_base.php');
}
// no direct access
defined('_JEXEC') or die;
// Include the syndicate functions only once
require_once dirname(__FILE__).DS.'helper.php';
$list = modIceCaption::getList($params);

$group 			= $params->get('group','content');
$tmp 		 	= $params->get('module_height', 'auto');
$moduleHeight   =($tmp=='auto') ? 'auto' :(int)$tmp.'px';
$tmp 			= $params->get('module_width', 'auto');
$moduleWidth    =($tmp=='auto') ? 'auto':(int)$tmp.'px';
$themeClass 	= $params->get('theme' , '');
$openTarget 	= $params->get('open_target', 'parent');
$class 			= !$params->get('navigator_pos', 0) ? '':'ice-'.$params->get('navigator_pos', 0);
$theme		    =  $params->get('theme', ''); 
$target 		= $params->get('open_target','_parent') != 'modalbox' ? 'target="'.$params->get('open_target','_parent').'"' : 'rel="'.$params->get('modal_rel','width:800,height:350').'" class="mb"'; 
$height 	    = intval($params->get('main_height', 200));
$width 	    	= intval($params->get('main_width', 160));
$color 			= $params->get('layout-sidenews-textcolor', 'FFFFFF');
if($color) $color = " color:#$color;";
$playMode 		= $params->get('play_mode', 'caption'); 
$trans 			= intval($params->get('opacity', 80));
$expheight 		= intval($params->get('expandheight', 150)); 
$colheight 		= intval($params->get('collapseheight', 30));

// load custom theme
if($theme && $theme != -1)
{
	require(modIceCaption::getLayoutByTheme($module, $group, $theme));
}
else
{
	require(JModuleHelper::getLayoutPath($module->module));	
} 
modIceCaption::loadMediaFiles($params, $module, $theme);
?>
<script type="text/javascript">
var options = {wrapperId:"ice-caption-<?php echo $module->id;?>", 
				mode:'<?php echo $playMode;?>',
				start:<?php echo $colheight;?>,
				end:<?php echo $expheight;?>,
				duration:<?php echo(int)$params->get('duration',250);?>,
				fullsize:<?php echo($playMode=='caption'? 0: 1);?>,
				opacity:<?php echo $trans;?>,
				xtransition:<?php echo $params->get('effect', 'Fx.Transitions.Expo.easeOut');?>,
				style:'<?php echo $params->get('style','vertical');?>',
				height:<?php echo $height;?>,
				width:<?php echo $width?>,
				fxOptions:{transition:<?php echo $params->get('effect', 'Fx.Transitions.Expo.easeOut');?>}					
		 };
var demo = new CaptionBoxSlide(options);	
</script>