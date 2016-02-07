<?php
/**
 * @version		$Id: offline.php 20196 2011-01-09 02:40:25Z ian $
 * @package		Joomla.Site
 * @copyright	Copyright (C) 2005 - 2011 Open Source Matters, Inc. All rights reserved.
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

// No direct access.
defined('_JEXEC') or die;


$app = JFactory::getApplication();
$params = JFactory::getApplication()->getTemplate(true)->params;
$TemplateStyle =  $params->get('TemplateStyle'); 
$logo =  $params->get('logo'); 
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php echo $this->language; ?>" lang="<?php echo $this->language; ?>" dir="<?php echo $this->direction; ?>">
<head>
	<jdoc:include type="head" />
		
        <link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/system/css/system.css" type="text/css" />
        <link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/reset.css" type="text/css" />
        <link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/typography.css" type="text/css" />
        <link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/forms.css" type="text/css" />
        
 <style type="text/css" media="screen">
/* Select the style */
/*\*/@import url("<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/<?php echo $TemplateStyle; ?>.css");/**/
</style>


<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/other.css" type="text/css" />
   

<link href="http://fonts.googleapis.com/css?family=PT+Sans:regular,italic,bold,bolditalic" rel="stylesheet" type="text/css" />

</head>

<body id="offline_page">


		
   <div class="wrapper">
             
        <?php jimport( 'joomla.application.module.helper' ); ?>
    
        <div id="logo">
            <a href="<?php echo $this->baseurl ?>"><img src="<?php echo $this->baseurl ?>/<?php echo htmlspecialchars($logo); ?>" alt="<?php echo $app->getCfg('sitename'); ?>" /></a>
        </div>
        
        
		   	<div id="content">   
    
    			<div id="content_inside">
                	
                    <div id="content_inside2">
		  
		  	
            <jdoc:include type="message" />
            
            <h1 class="offline"><?php echo $app->getCfg('offline_message'); ?></h1>
	
    
            <form action="index.php" method="post" name="login" id="form-login">
            
                <fieldset class="input">
                
                	<legend><?php echo JText::_('JACTION_LOGIN_ADMIN') ?></legend>
                    
                    
                    <p id="form-login-username">
                        <label for="username"><?php echo JText::_('JGLOBAL_USERNAME') ?></label>
                        <input name="username" id="username" type="text" class="inputbox" alt="<?php echo JText::_('JGLOBAL_USERNAME') ?>" size="18" />
                    </p>
                    <p id="form-login-password">
                        <label for="passwd"><?php echo JText::_('JGLOBAL_PASSWORD') ?></label>
                        <input type="password" name="password" class="inputbox" size="18" alt="<?php echo JText::_('JGLOBAL_PASSWORD') ?>" id="passwd" />
                    </p>
                    <p id="form-login-remember">
                        <label for="remember"><?php echo JText::_('JGLOBAL_REMEMBER_ME') ?></label>
                        <input type="checkbox" name="remember" class="inputbox" value="yes" alt="<?php echo JText::_('JGLOBAL_REMEMBER_ME') ?>" id="remember" />
                    </p>
                  
                    <input type="hidden" name="option" value="com_users" />
                    <input type="hidden" name="task" value="user.login" />
                    <input type="hidden" name="return" value="<?php echo base64_encode(JURI::base()) ?>" />
                    <?php echo JHtml::_('form.token'); ?>
                </fieldset>
                
                  <input type="submit" name="Submit" class="button" value="<?php echo JText::_('JLOGIN') ?>" />
                
			</form>
            
            
            </div>
            
            
            </div>
            
		</div>
    
    </div>
    
    
</body>
</html>
