<?php
/*---------------------------------------------------------------- 
  Copyright:
  (C) 2008 - 2010 IceTheme
  
  License:
  GNU/GPL http://www.gnu.org/copyleft/gpl.html
  
  Author:
  IceTheme - http://wwww.icetheme.com
---------------------------------------------------------------- */
// no direct access
defined('_JEXEC') or die('Restricted access');
?>        
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

<a onclick="return false;" href="javascript:void(0);" id="ice-caption-previous">Previous</a>
<a onclick="return false;" href="javascript:void(0);" id="ice-caption-next">Next</a>