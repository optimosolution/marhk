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
 
// no direct access
defined('_JEXEC') or die('Restricted access');

jimport('joomla.plugin.plugin');

class plgSystemIcemegamenu extends JPlugin
{    
	var $plugin 	= null;
	var $plgParams 	= null;
	var $time 		= 0;
    
    function __construct(&$subject, $config)
	{      
        parent::__construct($subject, $config);
    }
    
    function onContentPrepareForm($form, $data)
    {           
        if($form->getName() == 'com_menus.item')
		{            
            $xmlFile = dirname(__FILE__). DS."icemegamenu" . DS . 'params';
            JForm::addFormPath($xmlFile);
            $form->loadFile('params', false); 
        }
    }
}