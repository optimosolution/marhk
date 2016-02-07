<?php
/**
 * IceTabs Module for Joomla 1.6 By IceTheme
 * 
 * 
 * @copyright	Copyright (C) 2008 - 2011 IceTheme.com. All rights reserved.
 * @license		GNU General Public License version 2
 * 
 * @Website 	http://www.icetheme.com/Joomla-Extensions/icetabs.html
 * @Support 	http://www.icetheme.com/Forums/IceTabs/
 *
 */
 
 // No direct access.
defined('_JEXEC') or die;

?> 

<div id="ice-caption_wrapper">
     
<div id="ice-caption-<?php echo $module->id; ?>" class="ice-caption-candy ice-caption-<?php echo $params->get('style','vertical');?>" style="height:<?php echo $moduleHeight;?>; width:<?php echo $moduleWidth;?>">
	<div class="ice-caption-container" style="width:<?php echo $moduleWidth;?>; height:<?php echo $moduleHeight;?>">

		<div id="ice-caption-slide">
			<?php
				foreach($list as $i => $item) : 
				$onclick = '';
			?>
			<div class="ice-caption-none-style">
				<div class="ice-caption" <?php echo $onclick ;?> style="display:block; height:<?php echo $height;?>px; width:<?php echo $width;?>px" >
					<?php echo $item->mainImage;?>
					<div class="ice-caption-cover" style="height:<?php echo $colheight;?>px;" id="ice-caption-cover-<?php echo $i;?>">
					<div class="ice-opacity" style="height:<?php echo $height;?>px;"></div>
						<?php if($params->get('show_readmore','0')) { ?>
                        	<a href="<?php echo $item->link?>">
                         <?php }?>
                          <div class="ice-caption-content">
							
                            <div class="ice-infor">
								
                                <div class="ice-title">
									<?php echo $item->title;?>
								</div>
                                
								<div class="ice-desc">
								<?php echo strip_tags($item->description); ?>

								</div>
                                
							</div>
                            
						</div>
                        
                        <?php if($params->get('show_readmore','0')) { ?>
                        	</a>
                         <?php }?>
                        
                        
                        
					</div>	

				</div>
			</div>
			<?php endforeach; ?>
		</div>
	</div>
</div>	

</div>	

<a onclick="return false;" href="javascript:void(0);" id="ice-caption-previous">Previous</a>
<a onclick="return false;" href="javascript:void(0);" id="ice-caption-next">Next</a>