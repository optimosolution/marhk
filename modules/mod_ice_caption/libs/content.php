<?php
// No direct access
defined('_JEXEC') or die('Restricted access');
/**
 * $ModDesc
 * 
 * @version		$Id: helper.php $Revision
 * @package		modules
 * @subpackage	$Subpackage
 * @copyright	Copyright(C) May 2010 LandOfCoder.com <@emai:landofcoder@gmail.com>. All rights reserved.
 * @website 	htt://landofcoder.com
 * @license		GNU General Public License version 2
 */
if(!class_exists('IceGroupContent'))
{
	require_once JPATH_SITE.'/components/com_content/helpers/route.php';
	jimport('joomla.application.component.model');
	JModel::addIncludePath(JPATH_SITE.'/components/com_content/models');
	
	class IceGroupContent extends IceGroupBase{
		/**
		 * @var string $__name;
		 *
		 * @access private
		 */
		var $__name = 'content';
		
		/**
		 * override method: get list image from articles.
		 */
		function getListByParameters($params)
		{ 	
			if(JVersion::isCompatible('1.6.0'))
			{	
				return $this->__getListJLOneSix($params);
			} 
			return $this->__getListJLOneFive($params);
		}
		/**
		 * get the list of articles, using for joomla 1.6.x
		 * 
		 * @param JParameter $params;
		 * @return array;
		 */
		public static function __getListJLOneSix(&$params)
		{
			$formatter 		= $params->get('style_displaying', 'title');
			$titleMaxChars 	= $params->get('title_max_chars', '100');
			$descriptionMaxChars = $params->get('description_max_chars', 100);
			$thumbWidth    	=(int)$params->get('thumbnail_width', 60);
			$thumbHeight   	=(int)$params->get('thumbnail_height', 60);
			$imageHeight   	=(int)$params->get('main_height', 300) ;
			$imageWidth    	=(int)$params->get('main_width', 650) ;
			$isThumb       	= $params->get('auto_renderthumb',1);
			$isStripedTags 	= $params->get('auto_strip_tags', 0);
			$extraURL 		= $params->get('open_target')!='modalbox'?'':'&tmpl=component'; 
			$model 			= JModel::getInstance('Articles', 'ContentModel', array('ignore_request' => true));
			$image_quanlity = $params->get('image_quanlity', 100);
			
			// Set application parameters in model
			$appParams = JFactory::getApplication()->getParams();
			$model->setState('params', $appParams);
			$model->setState('list.select', 'a.fulltext, a.id, a.title, a.alias, a.title_alias, a.introtext, a.state, a.catid, a.created, a.created_by, a.created_by_alias,' . ' a.modified, a.modified_by,a.publish_up, a.publish_down, a.attribs, a.metadata, a.metakey, a.metadesc, a.access,' . ' a.hits, a.featured,' . ' LENGTH(a.fulltext) AS readmore');
			$openTarget = $params->get('open_target', 'parent');
			// Set the filters based on the module params
			$model->setState('list.start', 0);
			$model->setState('list.limit',(int) $params->get('limit_items', 5));
			$model->setState('filter.published', 1);
			$featured = $params->get('content_featured_items_show', 1);
			
			if(!$featured){
				$model->setState('filter.featured', 'hide');
			}
			elseif($featured == 2){
				$model->setState('filter.featured', 'only');
			}
			// Access filter
			$access 	= !JComponentHelper::getParams('com_content')->get('show_noauth');
			$authorised = JAccess::getAuthorisedViewLevels(JFactory::getUser()->get('id'));
			$model->setState('filter.access', $access);
			
			$source = trim($params->get('source', 'content_category'));
			if($source == 'content_category')
			{
				// Category filter
				$catids = $params->get('content_category','');
				$flag 	= true;
				if(is_array($catids) && count($catids) == 1)
				{
					if(empty($catids[0]))
					{
						$flag = false;
					}
				}
				if($flag)
				{
					$catids = is_array($catids) ? $catids : explode(",",$catids);
					$model->setState('filter.category_id', $catids);
				}
			}
			else
			{
				$ids = preg_split('/,/',$params->get('article_ids',''));	
				$tmp = array();
				foreach($ids as $id){
					$tmp[] =(int) trim($id);
				}
				$model->setState('filter.a_id', $tmp);
			}
			// User filter
			$userId 	= JFactory::getUser()->get('id');
			$ordering  	= $params->get('ordering', 'created_asc');
			$limit 	   	= $params->get('limit_items', 4);
			$ordering 	= explode('_', $ordering);
		
			if(trim($ordering[0]) == 'rand')
			{
					$model->setState('list.ordering', ' RAND() '); 
			}
			else
			{
				$model->setState('list.ordering', "a.".$ordering[0]);
				$model->setState('list.direction', $ordering[1]);
			}
			$items = $model->getItems();
			foreach($items as $key => &$item)
			{
				$item->slug 	= $item->id.':'.$item->alias;
				$item->catslug 	= $item->catid.':'.$item->category_alias;
	
				if($access || in_array($item->access, $authorised))
				{
					// We know that user has the privilege to view the article
					$item->link = JRoute::_(ContentHelperRoute::getArticleRoute($item->slug, $item->catslug));
				}
				else
				{
					$item->link = JRoute::_('index.php?option=com_user&view=login');
				}
				$item->date = JHtml::_('date', $item->created, JText::_('DATE_FORMAT_LC2')); 
				self::parseImages($item);
				if($item->mainImage &&  $image=self::renderThumb($item->mainImage, $imageWidth, $imageHeight, $item->title, $isThumb, $image_quanlity))
				{
					$item->mainImage = $image;
				}				
				$item->introtext 	= JHtml::_('content.prepare', $item->introtext);
				$item->description 	= self::html_substr($item->introtext, 0, $descriptionMaxChars, true,"...", $isStripedTags);	
			}
			return $items;
		}
		/**
		 * get the list of articles, using for joomla 1.5.x
		 * 
		 * @param JParameter $params;
		 * @return Array
		 */
		public static function __getListJLOneFive($params)
		{
			global $mainframe; 
			$maxTitle  	   = $params->get('max_title', '100');
			$maxDesciption = $params->get('max_description', 100);
			$openTarget    = $params->get('open_target', 'parent');
			$formatter     = $params->get('style_displaying', 'title');
			$titleMaxChars = $params->get('title_max_chars', '100');
			$descriptionMaxChars = $params->get('description_max_chars', 100);
			$condition     = IceGroupContent::_buildConditionQuery($params);
			$isThumb       = $params->get('auto_renderthumb',1);
			$ordering      = $params->get('ordering', 'created_asc');
			$limit 	       = $params->get('limit_items', 4);
			$ordering      = str_replace('_', '  ', $ordering);
			if(trim($ordering) == 'rand'){ $ordering = ' RAND() '; }
			$my 	       = &JFactory::getUser();
			$aid	       = $my->get('aid', 0);
			$thumbWidth    =(int)$params->get('thumbnail_width', 60);
			$thumbHeight   =(int)$params->get('thumbnail_height', 60);
			$imageHeight   =(int)$params->get('main_height', 300) ;
			$imageWidth    =(int)$params->get('main_width', 900) ;
			$isStripedTags = $params->get('auto_strip_tags', 0);
			$extraURL 	   = $params->get('open_target')!='modalbox'?'':'&tmpl=component'; 
			$image_quanlity = $params->get('image_quanlity', 100);
			
			$db	    = &JFactory::getDBO();
			$date   =& JFactory::getDate();
			$now    = $date->toMySQL();
			$cparam = &JComponentHelper::getParams('com_content');
			// make sql query
			$query 	= 'SELECT a.*,cc.description as catdesc, cc.title as category_title, cc.title as cattitle,s.description as secdesc, s.title as sectitle,' 
					. ' CASE WHEN CHAR_LENGTH(a.alias) THEN CONCAT_WS(":", a.id, a.alias) ELSE a.id END as slug,'
					. ' CASE WHEN CHAR_LENGTH(cc.alias) THEN CONCAT_WS(":",cc.id,cc.alias) ELSE cc.id END as catslug,'
					. ' CASE WHEN CHAR_LENGTH(s.alias) THEN CONCAT_WS(":", s.id, s.alias) ELSE s.id END as secslug'
					. "\n FROM #__content AS a"
					. ' INNER JOIN #__categories AS cc ON cc.id = a.catid' 
					. ' INNER JOIN #__sections AS s ON s.id = a.sectionid'
					. "\n WHERE a.state = 1"
					. "\n AND(a.publish_up = " . $db->Quote($db->getNullDate()) . " OR a.publish_up <= " . $db->Quote($now ) . ")"
					. "\n AND(a.publish_down = " . $db->Quote($db->getNullDate()) . " OR a.publish_down >= " . $db->Quote($now ) . ")"
					.((!$mainframe->getCfg('shownoauth')) ? "\n AND a.access <= " .(int) $aid : '')
			;
			
			$query .=  $condition . ' ORDER BY ' . $ordering;
			$query .=  $limit ? ' LIMIT ' . $limit : '';
			$db->setQuery($query);
			$data = $db->loadObjectlist();
			if(empty($data)) return array();
			JPluginHelper::importPlugin('content');
			$dispatcher   =& JDispatcher::getInstance();		
			
			foreach($data as $key => $item)
			{	 
				if($item->access <= $aid) {
					$data[$key]->link = JRoute::_(ContentHelperRoute::getArticleRoute($item->slug, $item->catslug, $item->sectionid).$extraURL);
				} else {
					$data[$key]->link = JRoute::_('index.php?option=com_user&view=login');
				}
				$item->introtext = JHTML::_('content.prepare', $item->introtext , $cparam);	
				$item->date = JHtml::_('date', $item->created, JText::_('DATE_FORMAT_LC2')); 
				$results = @$dispatcher->trigger('onPrepareContent', array(& $item, & $params, 0));
				self::parseImages($item);
				if($item->mainImage &&  $image=self::renderThumb($item->mainImage, $imageWidth, $imageHeight, $item->title, $isThumb, $image_quanlity)){
					$item->mainImage = $image;
				}
				$item->description = self::substring($item->introtext, $descriptionMaxChars, true);	
			}
			return $data;	
		}
		/**
		 * build condition query base parameter  
		 * 
		 * @param JParameter $params;
		 * @return string.
		 */
		function _buildConditionQuery($params)
		{
			$source = trim($params->get('source', 'content_category'));
			
			if($source == 'content_category')
			{
				$catids = $params->get('content_category','');
				if(!$catids){
					return '';
				}
				$catids = !is_array($catids) ? $catids : '"'.implode('","',$catids).'"';
				$condition = ' AND  a.catid IN('.$catids.')';
			}
			else
			{
				$ids = preg_split('/,/',$params->get('article_ids',''));	
				$tmp = array();
				foreach($ids as $id){
					$tmp[] =(int) trim($id);
				}
				$condition = " AND a.id IN('". implode("','", $tmp) ."')";
			}
			return $condition;
		}
	}
}