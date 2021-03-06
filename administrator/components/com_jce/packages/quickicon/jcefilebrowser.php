<?php
/**
 * @copyright	Copyright (C) 2005 - 2012 Open Source Matters, Inc. All rights reserved.
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

/**
 * Joomla! udpate notification plugin
 *
 * @package		Joomla.Plugin
 * @subpackage	Quickicon.Joomla
 * @since		2.5
 */
class plgQuickiconJcefilebrowser extends JPlugin
{
	/**
	 * Constructor
	 *
	 * @param       object  $subject The object to observe
	 * @param       array   $config  An array that holds the plugin configuration
	 *
	 * @since       2.5
	 */
	public function __construct(& $subject, $config)
	{
		parent::__construct($subject, $config);
		$this->loadLanguage();
	}

	/**
	 * This method is called when the Quick Icons module is constructing its set
	 * of icons. You can return an array which defines a single icon and it will
	 * be rendered right after the stock Quick Icons.
	 *
	 * @param  $context  The calling context
	 *
	 * @return array A list of icon definition associative arrays, consisting of the
	 *				 keys link, image, text and access.
	 *
	 * @since       2.5
	 */
	public function onGetIcons($context)
	{
		jimport('joomla.application.component.model');
		
		JModel::addIncludePath(JPATH_ADMINISTRATOR . DS . 'components' . DS . 'com_jce' . DS . 'models');
		$model = JModel::getInstance('model', 'WF');
		
		if ($context != $this->params->get('context', 'mod_quickicon') || !$model->authorize('browser')) {
			return;
		}
		
		$document = JFactory::getDocument();
		$language = JFactory::getLanguage();
		
		$language->load('com_jce', JPATH_ADMINISTRATOR);
		
		$width 	= $this->params->get('width', 800);
		$height = $this->params->get('height', 600);
		$filter = $this->params->get('filter', ''); 
		
		JHtml::_('behavior.modal');
		
		$document->addScriptDeclaration(
			"
		window.addEvent('domready', function() {
			SqueezeBox.assign($$('#plg_quickicon_jcefilebrowser a'), {
				handler: 'iframe', size: {x: " . $width . ", y: " . $height . "}
			});
		});"
		);
		
		require_once(JPATH_ADMINISTRATOR.'/components/com_jce/helpers/browser.php');

		return array(array(
			'link' 		=> WFBrowserHelper::getBrowserLink('', $filter),
			'image' 	=> 'header/icon-48-media.png',
			'access' 	=> array('jce.browser', 'com_jce'),
			'text' 		=> JText::_('WF_QUICKICON_BROWSER'),
			'id' 		=> 'plg_quickicon_jcefilebrowser'
		));
	}
}
