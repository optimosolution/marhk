<?php
/**
* Tweet Display Back Module for Joomla!
*
* @version		$Id: mod_tweetdisplayback.php 172 2011-04-08 01:44:00Z mbabker $
* @copyright	Copyright (C) 2010-2011 Michael Babker. All rights reserved.
* @license		GNU/GPL - http://www.gnu.org/copyleft/gpl.html
*/

// No direct access
defined('_JEXEC') or die;

// Check if cURL is loaded; if not, proceed no further
if (!extension_loaded('curl')) {
	echo JText::_('MOD_TWEETDISPLAYBACK_ERROR_NOCURL');
	return;
}
		
// Include the helper
require_once dirname(__FILE__).'/helper.php';

// Check if caching is enabled
if ($params->get('cache') == 1) {
	// Set the cache parameters
	$options = array(
		'defaultgroup' => 'mod_tweetdisplayback');
	$cache = JCache::getInstance('callback', $options);
	$cache->setLifeTime($params->get('cache_time') * 60);
	$cache->setCaching(true);

	// Call the cache; if expired, pull new data
	$twitter = $cache->call(array('modTweetDisplayBackHelper', 'compileData'), $params);
} else {
	// Pull new data
	$twitter = modTweetDisplayBackHelper::compileData($params);
}

if (isset($twitter->hits)) {
	echo JText::_('MOD_TWEETDISPLAYBACK_ERROR_NOHITS');
	return;
} else if (!$twitter) {
	echo JText::_('MOD_TWEETDISPLAYBACK_ERROR_UNABLETOLOAD');
	return;
}

require(JModuleHelper::getLayoutPath('mod_tweetdisplayback', $params->get('templateLayout', 'default')));
