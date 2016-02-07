<?php
/**
 * @version		$Id: edit.php 20250 2011-01-10 14:27:02Z chdemko $
 * @package		Joomla.Site
 * @subpackage	com_weblinks
 * @copyright	Copyright (C) 2005 - 2011 Open Source Matters, Inc. All rights reserved.
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

// no direct access
defined('_JEXEC') or die;

JHtml::_('behavior.keepalive');
JHtml::_('behavior.tooltip');
JHtml::_('behavior.formvalidation');

// Create shortcut to parameters.
$params = $this->state->get('params');
?>

<script type="text/javascript">
	Joomla.submitbutton = function(task) {
		if (task == 'weblink.cancel' || document.formvalidator.isValid(document.id('adminForm'))) {
			<?php echo $this->form->getField('description')->save(); ?>
			Joomla.submitform(task);
		}
		else {
			alert('<?php echo $this->escape(JText::_('JGLOBAL_VALIDATION_FORM_FAILED'));?>');
		}
	}
</script>
<div class="edit<?php echo $this->pageclass_sfx; ?>">
<?php if ($this->params->def('show_page_heading', 1)) : ?>
<h1>
	<?php echo $this->escape($this->params->get('page_heading')); ?>
</h1>
<?php endif; ?>
<form action="<?php echo JRoute::_('index.php?option=com_weblinks&view=form&w_id='.(int) $this->item->id); ?>" method="post" name="adminForm" id="adminForm" class="form-validate">
	<fieldset>
		<legend><?php echo JText::_('COM_WEBLINKS_LINK'); ?></legend>

			<dl>

				<dt><?php echo $this->form->getLabel('title'); ?></dt>
                <dd><?php echo $this->form->getInput('title'); ?></dd>
    
                <dt><?php echo $this->form->getLabel('catid'); ?></dt>
                <dd><?php echo $this->form->getInput('catid'); ?></dd>
    
                <dt><?php echo $this->form->getLabel('url'); ?></dt>
                <dd><?php echo $this->form->getInput('url'); ?></dd>
    
                <?php if ($this->user->authorise('core.edit.state', 'com_weblinks.weblink')): ?>
                    <dt><?php echo $this->form->getLabel('state'); ?></dt>
                    <dd><?php echo $this->form->getInput('state'); ?></dd>
                <?php endif; ?>
                
                <dt><?php echo $this->form->getLabel('language'); ?></dt>
                <dd><?php echo $this->form->getInput('language'); ?></dd>
            
                <dt><?php echo $this->form->getLabel('description'); ?></dt>
                <dd><?php echo $this->form->getInput('description'); ?></dd>

			</dl>

	</fieldset>

		<input type="hidden" name="return" value="<?php echo $this->return_page;?>" />
		<input type="hidden" name="task" value="" />
		<?php echo JHTML::_( 'form.token' ); ?>
        
        	<div class="formelm-buttons">
			<button type="button" onclick="Joomla.submitbutton('weblink.save')">
				<?php echo JText::_('JSAVE') ?>
			</button>
			<a href="javascript:void" onclick="Joomla.submitbutton('weblink.cancel')"><?php echo JText::_('JCANCEL') ?>
			</a>
			</div>
	</form>
</div>
