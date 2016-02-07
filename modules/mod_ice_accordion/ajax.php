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
if (!defined ('_JEXEC')) {
	define( '_JEXEC', 1 );
	$path = dirname(dirname(dirname(__FILE__)));
	define('JPATH_BASE', $path );
	if (strpos(php_sapi_name(), 'cgi') !== false && !empty($_SERVER['REQUEST_URI'])) {
		//Apache CGI
		$_SERVER['PHP_SELF'] =  rtrim(dirname(dirname($_SERVER['PHP_SELF'])), '/\\');
	} else {
		//Others
		$_SERVER['SCRIPT_NAME'] =  rtrim(dirname(dirname($_SERVER['SCRIPT_NAME'])), '/\\');
	}
	
	define( 'DS', DIRECTORY_SEPARATOR );
	require_once ( JPATH_BASE .DS.'includes'.DS.'defines.php' );
	require_once ( JPATH_BASE .DS.'includes'.DS.'framework.php' );
	JDEBUG ? $_PROFILER->mark( 'afterLoad' ) : null;

	/**
	 * CREATE THE APPLICATION
	 *
	 * NOTE :
	 */
	$mainframe = JFactory::getApplication('site');
	
	/**
	 * INITIALISE THE APPLICATION
	 *
	 * NOTE :
	 */
	$mainframe->initialise(array(
		'language' => $mainframe->getUserState( "application.lang", 'lang' )
	));
	JPluginHelper::importPlugin('system');
	
	// trigger the onAfterInitialise events
	JDEBUG ? $_PROFILER->mark('afterInitialise') : null;
	
	//$mainframe->triggerEvent('onAfterInitialise');
	// Route the application.
}
$lang =& JFactory::getLanguage();
$lang->load( "com_iproperty" );
jimport('joomla.application.module.helper');
function loadModuleById( $modId = 0)
	{
		$clean = array();
	
		$Itemid = JRequest::getInt('Itemid');
		$app	= JFactory::getApplication();
		$user	= JFactory::getUser();
		$groups	= implode(',', $user->getAuthorisedViewLevels());
		$db		= JFactory::getDbo();

		$query = $db->getQuery(true);
		$query->select('id, title, module, position, content, showtitle, params, mm.menuid');
		$query->from('#__modules AS m');
		$query->join('LEFT','#__modules_menu AS mm ON mm.moduleid = m.id');
		$query->where('m.published = 1 AND m.id ='.$modId);
			// Set the query
		$query->order('position, ordering');
		$clientid = (int) $app->getClientId();
		// Filter by language
		if ($app->isSite() && $app->getLanguageFilter()) {
			$query->where('m.language in (' . $db->Quote(JFactory::getLanguage()->getTag()) . ',' . $db->Quote('*') . ')');
		}

		// Set the query
		
		$db->setQuery($query);
		$modules = $db->loadObjectList();
		$cache 		= JFactory::getCache ('com_modules', 'callback');
		$cacheid 	= md5(serialize(array($Itemid, $groups, $clientid, JFactory::getLanguage()->getTag())));

		$modules = $cache->get(array($db, 'loadObjectList'), null, $cacheid, false);
		if (null === $modules)
		{
			JError::raiseWarning('SOME_ERROR_CODE', JText::sprintf('JLIB_APPLICATION_ERROR_MODULE_LOAD', $db->getErrorMsg()));
			$return = false;
			return $return;
		}

		// Apply negative selections and eliminate duplicates
		$negId	= $Itemid ? -(int)$Itemid : false;
		$dupes	= array();
		$clean	= array();
		for ($i = 0, $n = count($modules); $i < $n; $i++)
		{
			$module = &$modules[$i];

			// The module is excluded if there is an explicit prohibition, or if
			// the Itemid is missing or zero and the module is in exclude mode.
			$negHit	= ($negId === (int) $module->menuid)
					|| (!$negId && (int)$module->menuid < 0);

			if (isset($dupes[$module->id]))
			{
				// If this item has been excluded, keep the duplicate flag set,
				// but remove any item from the cleaned array.
				if ($negHit) {
					unset($clean[$module->id]);
				}
				continue;
			}
			$dupes[$module->id] = true;

			// Only accept modules without explicit exclusions.
			if (!$negHit)
			{
				//determine if this is a custom module
				$file				= $module->module;
				$custom				= substr($file, 0, 4) == 'mod_' ?  0 : 1;
				$module->user		= $custom;
				// Custom module name is given by the title field, otherwise strip off "com_"
				$module->name		= $custom ? $module->title : substr($file, 4);
				$module->style		= null;
				$module->position	= strtolower($module->position);
				$clean[$module->id]	= $module;
			}
		}
		unset($dupes);
		// Return to simple indexing that matches the query order.
		$clean = array_values($clean);

		return $clean;
}
$module_id = JRequest::getVar("moduleId",0);
$layout = JRequest::getVar("layout","_items");
$page = JRequest::getVar("p",0);

if(!empty($module_id) && !empty($page)){
	$modules = loadModuleById( $module_id );
	if(!empty($modules)){
		$module = $modules[0];
		$module->showtitle = 0;
		$module->content = null;
		 if(isset($module) && @$module->id){
			$content_module = JModuleHelper::renderModule($module);
			$search_text  = 'src="images';
			$replace_text = 'src="'.JURI::base( true ).'/images';
			echo JString::str_ireplace( $search_text, $replace_text, $content_module);
		}
	}
}
exit();
?>