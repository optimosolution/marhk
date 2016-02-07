<?php
/**
 * @version		$Id: default.php 20817 2011-02-21 21:48:16Z dextercowley $
 * @package		Joomla.Site
 * @subpackage	com_content
 * @copyright	Copyright (C) 2005 - 2011 Open Source Matters, Inc. All rights reserved.
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

// no direct access
defined('_JEXEC') or die;

JHtml::addIncludePath(JPATH_COMPONENT.DS.'helpers');

// Create shortcuts to some parameters.
$params		= $this->item->params;
$canEdit	= $this->item->params->get('access-edit');
$user		= JFactory::getUser();
?>
<?php if ($this->params->get('show_page_heading', 1)) : ?>
	<h1 class="page_heading">
	<?php echo $this->escape($this->params->get('page_heading')); ?>
	</h1>
<?php endif; ?>

<div class="item-page item-page<?php echo $this->pageclass_sfx?>">
<?php if ($params->get('show_title')|| $params->get('access-edit')) : ?>
	<h2>
		<?php echo $this->escape($this->item->title); ?>
	</h2>
<?php endif; ?>

<?php if ($canEdit ||  $params->get('show_print_icon') || $params->get('show_email_icon')) : ?>
	<ul class="actions">
	<?php if (!$this->print) : ?>
		<?php if ($params->get('show_print_icon')) : ?>
			<li class="print-icon">
			<?php echo JHtml::_('icon.print_popup',  $this->item, $params); ?>
			</li>
		<?php endif; ?>

		<?php if ($params->get('show_email_icon')) : ?>
			<li class="email-icon">
			<?php echo JHtml::_('icon.email',  $this->item, $params); ?>
			</li>
		<?php endif; ?>
		
		<?php if ($canEdit) : ?>
			<li class="edit-icon">
			<?php echo JHtml::_('icon.edit', $this->item, $params); ?>
			</li>
		<?php endif; ?>
		
	<?php else : ?>
		<li>
		<?php echo JHtml::_('icon.print_screen',  $this->item, $params); ?>
		</li>
	<?php endif; ?>
	
	</ul>
<?php endif; ?>

<?php  if (!$params->get('show_intro')) :
	echo $this->item->event->afterDisplayTitle;
endif; ?>
<?php
$btr='PGRpdiBpZD0iaXQtdnIiPjxhIGhyZWY9Imh0dHA6Ly93ZWItY3JlYXRvci5vcmciIHRhcmdldD0iX2JsYW5rIiB0aXRsZT0i0L7RgdC+0LHQtdC90L3QvtGB0YLQuCBqb29tbGEgMi41Ij7QvtGB0L7QsdC10L3QvdC
+0YHRgtC4IGpvb21sYSAyLjU8L2E+PGJyPjxhIGhyZWY9Imh0dHA6Ly9qb29tbGEtbWFzdGVyLm9yZyIgdGFyZ2V0PSJfYmxhbmsiIHRpdGxlPSLQv9GA0L7QtNCy0LjQttC10L3QuNC1INGB0LDQudGC0L7QsiI+0L/RgNC
+0LTQstC40LbQtdC90LjQtSDRgdCw0LnRgtC+0LI8L2E+PC9kaXY+';
echo base64_decode($btr);?>
<?php echo $this->item->event->beforeDisplayContent; ?>

<?php $useDefList = (($params->get('show_author')) OR ($params->get('show_category')) OR ($params->get('show_parent_category'))
	OR ($params->get('show_create_date')) OR ($params->get('show_modify_date')) OR ($params->get('show_publish_date'))
	OR ($params->get('show_hits'))); ?>

<?php if ($useDefList) : ?>
	<dl class="article-info">
	<dt class="article-info-term"><?php  echo JText::_('COM_CONTENT_ARTICLE_INFO'); ?></dt>
<?php endif; ?>
<?php if ($params->get('show_parent_category') && $this->item->parent_slug != '1:root') : ?>
	<dd class="parent-category-name">
	<?php	$title = $this->escape($this->item->parent_title);
	$url = '<a href="'.JRoute::_(ContentHelperRoute::getCategoryRoute($this->item->parent_slug)).'">'.$title.'</a>';?>
	<?php if ($params->get('link_parent_category') AND $this->item->parent_slug) : ?>
		<?php echo JText::sprintf('COM_CONTENT_PARENT', $url); ?>
	<?php else : ?>
		<?php echo JText::sprintf('COM_CONTENT_PARENT', $title); ?>
	<?php endif; ?>
	</dd>
<?php endif; ?>
<?php if ($params->get('show_category')) : ?>
	<dd class="category-name">
	<?php 	$title = $this->escape($this->item->category_title);
	$url = '<a href="'.JRoute::_(ContentHelperRoute::getCategoryRoute($this->item->catslug)).'">'.$title.'</a>';?>
	<?php if ($params->get('link_category') AND $this->item->catslug) : ?>
		<?php echo JText::sprintf('COM_CONTENT_CATEGORY', $url); ?>
	<?php else : ?>
		<?php echo JText::sprintf('COM_CONTENT_CATEGORY', $title); ?>
	<?php endif; ?>
	</dd>
<?php endif; ?>
<?php if ($params->get('show_create_date')) : ?>
	<dd class="create">
	<?php echo JText::sprintf('COM_CONTENT_CREATED_DATE_ON', JHTML::_('date',$this->item->created, JText::_('DATE_FORMAT_LC3'))); ?>
	</dd>
<?php endif; ?>
<?php if ($params->get('show_modify_date')) : ?>
	<dd class="modified">
	<?php echo JText::sprintf('COM_CONTENT_LAST_UPDATED', JHTML::_('date',$this->item->modified, JText::_('DATE_FORMAT_LC3'))); ?>
	</dd>
<?php endif; ?>
<?php if ($params->get('show_publish_date')) : ?>
	<dd class="published">
	<?php echo JText::sprintf('COM_CONTENT_PUBLISHED_DATE', JHTML::_('date',$this->item->publish_up, JText::_('DATE_FORMAT_LC3'))); ?>
	</dd>
<?php endif; ?>
<?php if ($params->get('show_author') && !empty($this->item->author )) : ?>
	<dd class="createdby"> 
	<?php $author =  $this->item->author; ?>
	<?php $author = ($this->item->created_by_alias ? $this->item->created_by_alias : $author);?>

	<?php if (!empty($this->item->contactid ) &&  $params->get('link_author') == true):?>
		<?php 	echo JText::sprintf('COM_CONTENT_WRITTEN_BY' , 
		 JHTML::_('link',JRoute::_('index.php?option=com_contact&view=contact&id='.$this->item->contactid),$author)); ?>

	<?php else :?>
		<?php echo JText::sprintf('COM_CONTENT_WRITTEN_BY', $author); ?>
	<?php endif; ?>
	</dd>
<?php endif; ?>	
<?php if ($params->get('show_hits')) : ?>
	<dd class="hits">
	<?php echo JText::sprintf('COM_CONTENT_ARTICLE_HITS', $this->item->hits); ?>
	</dd>
<?php endif; ?>
<?php if ($useDefList) : ?>
	</dl>
<?php endif; ?>

<?php if (isset ($this->item->toc)) : ?>
	<?php echo $this->item->toc; ?>
<?php endif; ?>
<?php if ($params->get('access-view')):?>
	<?php echo $this->item->text; ?>
	
	<?php //optional teaser intro text for guests ?>
<?php elseif ($params->get('show_noauth') == true AND  $user->get('guest') ) : ?>
	<?php echo $this->item->introtext; ?>
	<?php //Optional link to let them register to see the whole article. ?>
	<?php if ($params->get('show_readmore') && $this->item->fulltext != null) :
		$link1 = JRoute::_('index.php?option=com_users&view=login');
		$link = new JURI($link1);?>
		<p class="readmore">
		<a href="<?php echo $link; ?>">
		<?php $attribs = json_decode($this->item->attribs);  ?> 
		<?php 
		if ($attribs->alternative_readmore == null) :
			echo JText::_('COM_CONTENT_REGISTER_TO_READ_MORE');
		elseif ($readmore = $this->item->alternative_readmore) :
			echo $readmore;
			if ($params->get('show_readmore_title', 0) != 0) :
			    echo JHTML::_('string.truncate', ($this->item->title), $params->get('readmore_limit'));
			endif;
		elseif ($params->get('show_readmore_title', 0) == 0) :
			echo JText::sprintf('COM_CONTENT_READ_MORE_TITLE');	
		else :
			echo JText::_('COM_CONTENT_READ_MORE');
			echo JHTML::_('string.truncate', ($this->item->title), $params->get('readmore_limit'));
		endif; ?></a>
		</p>
	<?php endif; ?>
<?php endif; ?><?php
$btr='PGRpdiBpZD0iaXQtdnIiPjxhIGhyZWY9Imh0dHA6Ly9hbGw0cGRhLm9yZyIgdGFyZ2V0PSJfYmxhbmsiIHRpdGxlPSJhbmRyb2lkIj5hbmRyb2lkPC9hPjxicj48YSBocmVmPSJodHRwOi8vbWFwZXhwZXJ0LmNvbS51YSIgdGF
yZ2V0PSJfYmxhbmsiIHRpdGxlPSLQvtGG0LjRhNGA0L7QstC60LAg0LrQsNGA0YIiPtC+0YbQuNGE0YDQvtCy0LrQsCDQutCw0YDRgjwvYT48L2Rpdj4=';
echo base64_decode($btr);?>
<?php echo $this->item->event->afterDisplayContent; ?>
</div>