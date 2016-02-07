<?php 
//  @copyright	Copyright (C) 2008 - 2011 IceTheme. All Rights Reserved
//  @license	Copyrighted Commercial Software 
//  @author     IceTheme (icetheme.com)

// No direct access.
defined('_JEXEC') or die;

// A code to show the offline.php page for the demo
if(JRequest::getCmd("tmpl","index")== "offline"){	
	if(is_file(dirname(__FILE__).DS."offline.php")){
		require_once(dirname(__FILE__).DS."offline.php");
	}else{
		if(is_file(JPATH_SITE.DS."templates".DS."system".DS."offline.php")){
			require_once(JPATH_SITE.DS."templates".DS."system".DS."offline.php");
		}
	}
}else{

// Include PHP files to the template
include_once(JPATH_ROOT . "/templates/" . $this->template . '/icetools/default.php');
include_once(JPATH_ROOT . "/templates/" . $this->template . '/icetools/switcher.php');

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php echo $this->language; ?>" lang="<?php echo $this->language; ?>" dir="<?php echo $this->direction; ?>" >
	
<head>

<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE9" />

<jdoc:include type="head" />

<?php
// Include CSS and JS variables 
include_once(JPATH_ROOT . "/templates/" . $this->template . '/css_vars.php');
?>

</head>

<body class="<?php echo $pageclass->get('pageclass_sfx'); ?>">

<div id="site_wrapper">


<!-- Accessibility -->
<ol id="accessibility">
    <li><a href="#nav-wrapper"><?php echo JText::_("SKIP_MENU");?></a></li>
    <li><a href="#content"><?php echo JText::_("SKIP_CONTENT");?></a></li>
    <li><a href="#footer" ><?php echo JText::_("SKIP_FOOTER");?></a></li>
</ol><!-- Accessibility -->

	
   
    <!-- Header --> 	
	<div id="header" class="clearfix">
    	
        <div class="wrapper">
        	

                <div id="logo">
                    <p><a href="<?php echo $this->baseurl ?>"><img src="<?php echo $this->baseurl ?>/<?php echo htmlspecialchars($logo); ?>" alt="<?php echo $sitename;?>" /></a></p>
                </div>
                
                <?php if ($this->countModules('language')) { ?> 
                <div id="language">
                    <jdoc:include type="modules" name="language" />
                </div>
                <?php } ?> 
                
                
                <?php if ($this->countModules('contact')) { ?> 
                <div id="contact_nr">
                    <jdoc:include type="modules" name="contact" />
                </div>
                <?php } ?>
                
                
                 <?php if ($this->countModules('date')) { ?> 
                <div id="date">
                    <jdoc:include type="modules" name="date" />
                </div>
                <?php } ?>
                
                
                <?php if ($this->countModules('slogan')) { ?> 
                <div id="slogan">
                    <jdoc:include type="modules" name="slogan" />
                </div>
                <?php } ?> 

          
		</div>	
                   
	</div><!-- Header -->	
    
   
    <?php if ($this->countModules('mainmenu')) { ?>
    <!-- Main Nav --> 
    <div id="nav-wrapper">
         <jdoc:include type="modules" name="mainmenu" />
    </div><!-- Main Nav --> 
    <?php } ?>  
                
                 
   
	<!-- Content --> 
    <div id="content" class="clearfix">   
		
        <div id="content_t">
                
			<?php if ($this->countModules('search')) { ?> 
            <div id="search">
            	<jdoc:include type="modules" name="search" />
            </div>
            <?php } ?>  
            
             <?php if ($this->countModules('topmenu')) { ?> 
            <div id="topmenu">
                <jdoc:include type="modules" name="topmenu" />
            </div>
            <?php } ?>
            
		</div>
            
           
		<?php if ($this->countModules('left')) { ?>
        <!-- Left Column -->
        <div id="left-column">
            <jdoc:include type="modules" name="left" style="colmodule"  />
        </div> <!-- Left Column -->
        <?php } ?>
                 
                 
             
        <div id="content_inside">
        

			<?php if ($this->countModules('icetabs')) { ?>
            <div id="icetabs" class="clearfix">
                 <jdoc:include type="modules" name="icetabs" />
            </div>
            <?php } ?>
        
        
			<?php if ($this->countModules('promo1 + promo2 + promo3')) { ?>
            <!-- Promo -->
            <div id="promo" class="clearfix">
                
                    <?php if ($this->countModules('promo1')) { ?>
                    <div class="<?php echo $promomodulewidth; ?> <?php echo $promomodsep1; ?> floatleft">
                        <jdoc:include type="modules" name="promo1" style="block"  />
                    </div>
                    <?php } ?>
                    <?php if ($this->countModules('promo2')) { ?>
                    <div class="<?php echo $promomodulewidth; ?> <?php echo $promomodsep2; ?> floatleft">
                        <jdoc:include type="modules" name="promo2" style="block"  />
                    </div>
                    <?php } ?>
                    <?php if ($this->countModules('promo3')) { ?>
                    <div class="<?php echo $promomodulewidth; ?> floatleft">
                        <jdoc:include type="modules" name="promo3" style="block"  />
                    </div>
                    <?php } ?>
                
                
                 <div id="promo_effect"></div>
                 
            </div><!-- Promo -->  
            <?php } ?>         
        

        
            <!-- Columns Container -->    
            <div id="columns-container">
            
                    <div id="outer-column-container">
                        
                        <div id="inner-column-container" class="clearfix">
                    
                            <div id="source-order-container">
                                                
                                <!-- Middle Column -->   
                                <div id="middle-column">
                                                                    
                                    <div class="inside">       
                                            
                                        <jdoc:include type="message" />
                                    
                                        <jdoc:include type="component" />
                    
                                    </div>	
                                     
                                </div><!-- Middle Column -->         
                    
                            </div><!-- Source Order Container --> 
                                         
                                                                     
                            <?php if ($this->countModules('right')) { ?>
                            <!-- Right Column -->
                            <div id="right-column">
                                                
                                <div class="inside">
                    
                                       <jdoc:include type="modules" name="right" style="colmodule"  />
                                              
                                 </div>
                                 
                             </div><!-- Right Column -->
                             
                             <div class="clear-columns"></div>
                            <?php } ?>
                            
                                                                                        
                        </div>
                    
                    </div>
            
                </div>
                                    
            </div><!-- Columns Container --> 

            
		</div>

          
	</div><!-- Content -->  
   	
  
  
    <!-- Bottom -->
    <div id="bottom" class="clearfix">
            
		<?php if ($this->countModules('online')) { ?>
        <div id="mod_online">
            <jdoc:include type="modules" name="online"  />
        </div>
        <?php } ?>
        
        
         <!-- BreadCrumbs --> 
        <?php if ($this->countModules('breadcrumbs')) { ?> 
        <div id="breadcrumbs" class="clearfix">
           <jdoc:include type="modules" name="breadcrumbs" />
        </div><!-- BreadCrumbs -->    
        <?php } ?>
      
                           
        
        <?php if ($this->countModules('bottom1')) { ?>
        <div class="<?php echo $botmodwidth; ?> <?php echo $botmodsep1; ?> floatleft">
            <jdoc:include type="modules" name="bottom1" style="block"  />
        </div>
        <?php } ?>
        <?php if ($this->countModules('bottom2')) { ?>
        <div class="<?php echo $botmodwidth; ?> <?php echo $botmodsep2; ?> floatleft">
            <jdoc:include type="modules" name="bottom2" style="block"  />
        </div>
        <?php } ?>
        <?php if ($this->countModules('bottom3')) { ?>
        <div class="<?php echo $botmodwidth; ?> <?php echo $botmodsep3; ?> floatleft">
            <jdoc:include type="modules" name="bottom3" style="block"  />
        </div>
        <?php } ?>
        <?php if ($this->countModules('bottom4')) { ?>
        <div class="<?php echo $botmodwidth; ?> floatleft">
            <jdoc:include type="modules" name="bottom4" style="block"  />
        </div>
        <?php } ?>
            
      
      <div id="bottom-effect"></div>
                           
    </div><!-- Bottom -->  
        
        
          
    
    
     <?php if ($this->countModules('footer1 + footer2 + footer3 + footer4')) { ?>
      <!-- Footer -->
     <div id="footer">
                          
        <div class="wrapper clearfix">
        
            <?php if ($this->countModules('footer1')) { ?>
            <div class="<?php echo $footermodulewidth; ?> <?php echo $footermodsep1; ?> floatleft">
                <jdoc:include type="modules" name="footer1" style="block"  />
            </div>
            <?php } ?>
            <?php if ($this->countModules('footer2')) { ?>
            <div class="<?php echo $footermodulewidth; ?> <?php echo $footermodsep2; ?> floatleft">
                <jdoc:include type="modules" name="footer2" style="block"  />
            </div>
            <?php } ?>
            <?php if ($this->countModules('footer3')) { ?>
            <div class="<?php echo $footermodulewidth; ?> <?php echo $footermodsep3; ?> floatleft">
                <jdoc:include type="modules" name="footer3" style="block"  />
            </div>
            <?php } ?>	
            <?php if ($this->countModules('footer4')) { ?>
            <div class="<?php echo $footermodulewidth; ?>  <?php echo $footermodsep4; ?> floatleft">
                <jdoc:include type="modules" name="footer4" style="block"  />
            </div>
            <?php } ?>	
            
             <?php if ($this->countModules('footer5')) { ?>
            <div class="<?php echo $footermodulewidth; ?> floatleft">
                <jdoc:include type="modules" name="footer5" style="block"  />
            </div>
            <?php } ?>	
            
          
         </div>  	

	</div><!-- Footer --> 
    <?php } ?>	 
    
    
    
        <!-- Copyright --> 
        <div id="copyright">
        
            <div class="wrapper">
                
                <?php if($this->params->get('icelogo')) { ?>
                <div id="icelogo">
                    <p><a href="http://www.icetheme.com"><span><?php echo JText::_("ICETHEMECOPY");?></span></a></p>
                </div>
                <?php } ?>
                
                <?php if ($this->countModules('footermenu')) { ?>
                <div id="copyrightmenu">
                    <jdoc:include type="modules" name="footermenu" />
                </div>
                <?php } ?>
            
                <?php if ($this->countModules('footer')) { ?>
                <div id="copytext" class="floatleft">
                    <jdoc:include type="modules" name="footer" />
                </div>
                <?php } ?>
                
                <?php if($this->params->get('go2top')) { ?>
                <script type="text/javascript">
                    window.addEvent('domready',function() { new SmoothScroll({ duration: 800 }); })
                </script>
                    <a id="go2top" href="#header"  class="hasTip" title="<?php echo JText::_("GOTOP");?>" ><span><?php echo JText::_("GOTOP");?></span></a>
                <?php } ?>
               
          
            </div>
            
        </div><!-- Copyright -->

    

<!-- javascript code to make J! tooltips -->
<script type="text/javascript">
 	window.addEvent('domready', function() {
			$$('.hasTip').each(function(el) {
				var title = el.get('title');
				if (title) {
					var parts = title.split('::', 2);
					el.store('tip:title', parts[0]);
					el.store('tip:text', parts[1]);
				}
			});
		var JTooltips = new Tips($$('.hasTip'), { fixed: false});
	});
 </script>
 
 
 <jdoc:include type="modules" name="debug" />


</body>
</html>

<?php } ?>