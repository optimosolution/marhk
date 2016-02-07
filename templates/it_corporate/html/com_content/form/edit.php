<?php
/**
 * @version		$Id: edit.php 20196 2011-01-09 02:40:25Z ian $
 * @package		Joomla.Site
 * @subpackage	com_content
 * @copyright	Copyright (C) 2005 - 2011 Open Source Matters, Inc. All rights reserved.
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

// no direct access
defined('_JEXEC') or die;

JHtml::_('behavior.keepalive');
JHtml::_('behavior.tooltip');
JHtml::_('behavior.calendar');
JHtml::_('behavior.formvalidation');

// Create shortcut to parameters.
$params = $this->state->get('params');
?>

<script type="text/javascript">
	Joomla.submitbutton = function(task) {
		if (task == 'article.cancel' || document.formvalidator.isValid(document.id('adminForm'))) {
			<?php echo $this->form->getField('articletext')->save(); ?>
			Joomla.submitform(task);
		} else {
			alert('<?php echo $this->escape(JText::_('JGLOBAL_VALIDATION_FORM_FAILED'));?>');
		}
	}
</script>
<div class="edit item-page<?php echo $this->pageclass_sfx; ?>">
<?php if ($params->get('show_page_heading', 1)) : ?>
<h1>
	<?php echo $this->escape($params->get('page_heading')); ?>
</h1>
<?php endif; ?>

<form action="<?php echo JRoute::_('index.php?option=com_content&a_id='.(int) $this->item->id); ?>" method="post" name="adminForm" id="adminForm" class="form-validate">
	<fieldset>
		<legend><?php echo JText::_('JEDITOR'); ?></legend>

		<dl class="clearfix">	
        
			<dt><?php echo $this->form->getLabel('title'); ?></dt>
			<dd><?php echo $this->form->getInput('title'); ?></dd>

		<?php if (is_null($this->item->id)):?>
			<dt><?php echo $this->form->getLabel('alias'); ?></dt>
			<dd><?php echo $this->form->getInput('alias'); ?></dd>
		<?php endif; ?>

		</dl>	
			<?php echo $this->form->getInput('articletext'); ?>

	</fieldset>

	<fieldset>
		<legend><?php echo JText::_('COM_CONTENT_PUBLISHING'); ?></legend>
		
        <dl>
        
		<dt><?php echo $this->form->getLabel('catid'); ?></dt>
		<dd><?php echo $this->form->getInput('catid'); ?></dd>

		<dt><?php echo $this->form->getLabel('created_by_alias'); ?></dt>
		<dd><?php echo $this->form->getInput('created_by_alias'); ?></dd>

	<?php if ($this->item->params->get('access-change')): ?>

		<dt><?php echo $this->form->getLabel('state'); ?></dt>
		<dd><?php echo $this->form->getInput('state'); ?></dd>

		<dt><?php echo $this->form->getLabel('featured'); ?></dt>
		<dd><?php echo $this->form->getInput('featured'); ?></dd>

		<dt><?php echo $this->form->getLabel('publish_up'); ?></dt>
		<dd><?php echo $this->form->getInput('publish_up'); ?></dd>
		
		<dt><?php echo $this->form->getLabel('publish_down'); ?></dt>
		<dd><?php echo $this->form->getInput('publish_down'); ?></dd>

	<?php endif; ?>

		<dt><?php echo $this->form->getLabel('access'); ?></dt>
		<dd><?php echo $this->form->getInput('access'); ?></dd>

		<?php if (is_null($this->item->id)):?>
			<div class="form-note">
			<p><?php echo JText::_('COM_CONTENT_ORDERING'); ?></p>
			</div>
		<?php endif; ?>
        
        </dl>
        
	</fieldset>

	<fieldset>
		<legend><?php echo JText::_('JFIELD_LANGUAGE_LABEL'); ?></legend>
		 <dl>
         <dt><?php echo $this->form->getLabel('language'); ?></dt>
		<dd><?php echo $this->form->getInput('language'); ?></dd>
        </dl>
	</fieldset>

	<fieldset>
		<legend><?php echo JText::_('COM_CONTENT_METADATA'); ?></legend>
		<dl>
        <dt><?php echo $this->form->getLabel('metadesc'); ?></dt>
		<dd><?php echo $this->form->getInput('metadesc'); ?></dd>

		<dt><?php echo $this->form->getLabel('metakey'); ?></dt>
		<dd><?php echo $this->form->getInput('metakey'); ?></dd>
        
		</dl>
		<input type="hidden" name="task" value="" />
		<input type="hidden" name="return" value="<?php echo $this->return_page;?>" />
		<?php echo JHTML::_( 'form.token' ); ?>
	</fieldset>
    
    <div class="formelm-buttons">
			<button type="button" onclick="Joomla.submitbutton('article.save')">
				<?php echo JText::_('JSAVE') ?>
			</button>
			<a href="javascript:void" onclick="Joomla.submitbutton('article.cancel')"><?php echo JText::_('JCANCEL') ?>
			</a>
			</div>
            
</form>
</div>