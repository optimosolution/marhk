<?php 
/*---------------------------------------------------------------- 
  Copyright:
 (C) 2008 - 2010 IceTheme
  
  License:
  GNU/GPL http://www.gnu.org/copyleft/gpl.html
  
  Author:
  IceTheme - http://wwww.icetheme.com
---------------------------------------------------------------- */
// no direct access
defined('_JEXEC') or die;

require_once JPATH_SITE.DS.'components'.DS.'com_content'.DS.'helpers'.DS.'route.php';
if(!class_exists('IceGroupBase'))
{
	require_once(dirname(__FILE__).DS.'libs'.DS.'group_base.php');
}

abstract class modIceCaption
{	
	/**
	 * get list articles
	 */
	public static function getList($params)
	{
		if($params->get('enable_cache'))
		{
			$cache =& JFactory::getCache('mod_ice_caption');
			$cache->setCaching(true);
			$cache->setLifeTime($params->get('cache_time', 15) * 60);	
			return $cache->get(array('modIceCaption' , 'getGroupObject'), array($params)); 
		}
		else
		{
			return self::getGroupObject($params);
		}	
	}
	/**
	 * get list articles
	 */
	public static function getGroupObject($params)
	{
		$group 	= $params->get('group', 'content');
		$file 	= dirname(__FILE__).DS.'libs'.DS.trim($group).'.php';
		
		if(file_exists($file))
		{
			require_once($file);
			$className = 'IceGroup'.ucfirst($group);
			
			if(class_exists($className))
			{
				$object = new $className($group);	
				$object->setCurrentPath( dirname(__FILE__).DS.'libs'.DS.'groups'.DS.strtolower($group).DS);	
			}
		}
		if($object)
		{
			return $object->getListByParameters($params);	
		}
		else
		{
			return array();
		}
	}
	/**
	 * load css - javascript file.
	 * 
	 * @param JParameter $params;
	 * @param JModule $module
	 * @return void.
	 */
	public static function loadMediaFiles($params, $module, $theme='')
	{
		$mainframe = JFactory::getApplication();
		JHTML::script('modules/'.$module->module.'/assets/'.'script_16.js');						
		
		if($theme && $theme != -1)
		{
			$tPath = JPATH_BASE.DS.'templates'.DS.$mainframe->getTemplate().DS.'html'.DS.$module->module.DS.$theme.DS.'assets'.DS.'style.css';
			
			if(file_exists($tPath))
			{
				JHTML::stylesheet('templates/'.$mainframe->getTemplate().'/html/'.$module->module.'/'.$theme.'/assets/style.css');
			}
			else
			{
				JHTML::stylesheet('modules/'.$module->module.'/themes/'.$theme.'/assets/style.css');	
			}
		}
		else
		{
			JHTML::stylesheet('modules/'.$module->module.'/assets/style.css');	
		}
	}
	/**
	 *
	 */
	public function renderItem(&$row, $params, $layout='_item')
	{
		$target = $params->get('open_target','_parent') != 'modalbox' ? 'target="'.$params->get('open_target','_parent').'"' : 'rel="'.$params->get('modal_rel','width:800,height:350').'" class="mb"';
		
		$path = dirname(__FILE__).DS.'themes'.DS.$params->get('theme').DS;
		if(file_exists($path.$params->get('group').$layout.'.php'))
		{
			require($path.$params->get('group').$layout.'.php');
			return ;
		}
		require($path.$layout.'.php');
	}
	/**
	 * load theme
	 */
	public static function getLayoutByTheme($module, $group, $theme= '')
	{
		$mainframe 	= JFactory::getApplication();
		$layout 	= 'default';
		if($theme)
		{
			$layout = trim($theme).'_default';
		}
		// Build the template and base path for the layout
		$tPath = JPATH_BASE.DS.'templates'.DS.$mainframe->getTemplate().DS.'html'.DS.$module->module.DS.$theme.DS.'default.php';
		$bPath = JPATH_BASE.DS.'modules'.DS.$module->module.DS.'themes'.DS.$theme.DS.'default.php';
		// If the template has a layout override use it
		if(file_exists($tPath))
		{
			return $tPath;
		}
		elseif(file_exists($bPath))
		{
			return $bPath;
		}
	}
}