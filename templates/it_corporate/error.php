<?php
/**
 * @version		$Id: error.php 20196 2011-01-09 02:40:25Z ian $
 * @package		Joomla.Site
 * @copyright	Copyright (C) 2005 - 2011 Open Source Matters, Inc. All rights reserved.
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

// No direct access.
defined('_JEXEC') or die;

if (!isset($this->error)) {
	$this->error = JError::raiseWarning(404, JText::_('JERROR_ALERTNOAUTHOR'));
	$this->debug = false; 
}

$app = JFactory::getApplication();
$params = JFactory::getApplication()->getTemplate(true)->params;
$TemplateStyle =  $params->get('TemplateStyle'); 
$logo =  $params->get('logo'); 

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php echo $this->language; ?>" lang="<?php echo $this->language; ?>" dir="<?php echo $this->direction; ?>">
<head>
	<title><?php echo $this->error->getCode(); ?> - <?php echo $this->title; ?></title>
    
		<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/system/css/system.css" type="text/css" />
        <link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/reset.css" type="text/css" />
        <link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/forms.css" type="text/css" />
         <link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/typography.css" type="text/css" />
         
<style type="text/css" media="screen">
/* Select the style */
/*\*/@import url("<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/<?php echo $TemplateStyle; ?>.css");/**/
</style>


		<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/other.css" type="text/css" />
        
        
       <link href="http://fonts.googleapis.com/css?family=PT+Sans:regular,italic,bold,bolditalic" rel="stylesheet" type="text/css" />
        
</head>


<body class="errorpage">


	<div class="wrapper">
	

                            
        <?php jimport( 'joomla.application.module.helper' ); ?>
    
        <div id="logo">
            <a href="<?php echo $this->baseurl ?>"><img src="<?php echo $this->baseurl ?>/<?php echo htmlspecialchars($logo); ?>" alt="<?php echo htmlspecialchars($params->get('sitetitle'));?>" /></a>
        </div>
        
    
      <div id="content"> 
      
     <div id="content_inside">
                	
                    <div id="content_inside2">
        
            <h1><?php echo JText::_('JERROR_AN_ERROR_HAS_OCCURRED'); ?>
             <?php echo JText::_('JERROR_LAYOUT_PAGE_NOT_FOUND'); ?></h1>
                
                <p class="notice"><strong><?php echo $this->error->getCode() ; echo " "; echo $this->error->getMessage();?></strong></p>
                                
                            
			
            	<div id="outline">
					
                    <div id="errorboxoutline">
                    
							
                            
                            <div id="errorboxbody">
							
                            
                            	<p><strong><?php echo JText::_('JERROR_LAYOUT_NOT_ABLE_TO_VISIT'); ?></strong></p>
                                
                                
                                <ol>
                                    <li><?php echo JText::_('JERROR_LAYOUT_AN_OUT_OF_DATE_BOOKMARK_FAVOURITE'); ?></li>
                                    <li><?php echo JText::_('JERROR_LAYOUT_SEARCH_ENGINE_OUT_OF_DATE_LISTING'); ?></li>
                                    <li><?php echo JText::_('JERROR_LAYOUT_MIS_TYPED_ADDRESS'); ?></li>
                                    <li><?php echo JText::_('JERROR_LAYOUT_YOU_HAVE_NO_ACCESS_TO_THIS_PAGE'); ?></li>
                                    <li><?php echo JText::_('JERROR_LAYOUT_REQUESTED_RESOURCE_WAS_NOT_FOUND'); ?></li>
                                    <li><?php echo JText::_('JERROR_LAYOUT_ERROR_HAS_OCCURRED_WHILE_PROCESSING_YOUR_REQUEST'); ?></li>
                                </ol>
                                
								
                                <p><strong><?php echo JText::_('JERROR_LAYOUT_PLEASE_TRY_ONE_OF_THE_FOLLOWING_PAGES'); ?></strong></p>

                                    <ul>
                                        <li><a href="<?php echo $this->baseurl; ?>/index.php" title="<?php echo JText::_('JERROR_LAYOUT_GO_TO_THE_HOME_PAGE'); ?>"><?php echo JText::_('JERROR_LAYOUT_HOME_PAGE'); ?></a></li>
                                    </ul>


                            <p><?php echo JText::_('JERROR_LAYOUT_PLEASE_CONTACT_THE_SYSTEM_ADMINISTRATOR'); ?>.</p>
                            <div id="techinfo">
                            <p><span class="highlight"><?php echo $this->error->getMessage(); ?></span></p>
                            <p>
                                <?php if ($this->debug) :
                                    echo $this->renderBacktrace();
                                endif; ?>
                            </p>
                            </div>
                            </div>
                        </div>
                        </div>
                    </div>
                          
               
                </div>
                          
                    
             </div>             


	</div>
    
</body>
</html>


