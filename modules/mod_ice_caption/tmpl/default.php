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
<div id="ice-caption-<?php echo $module->id; ?>" class="ice-caption-<?php echo $params->get('style','vertical');?>" style="height:<?php echo $moduleHeight;?>; width:<?php echo $moduleWidth;?>">
	<div class="ice-caption-container" style="width:<?php echo $moduleWidth;?>; height:<?php echo $moduleHeight;?>">
		<a onclick="return false;" href="javascript:void(0);" id="ice-caption-previous">Previous</a>
		<a onclick="return false;" href="javascript:void(0);" id="ice-caption-next">Next</a>
		<div id="ice-caption-slide">
		<?php foreach($list as $i => $item) : 
			$onclick = '';
		?>
			<div class="ice-caption-none-style">
				<div class="ice-caption" <?php echo $onclick ;?> style="display:block; height:<?php echo $height;?>px; width:<?php echo $width;?>px" >
					<?php echo $item->mainImage;?>
					<div class="ice-caption-cover" style="height:<?php echo $colheight;?>px;">
					<div class="ice-opacity" style="height:<?php echo $height;?>px;"></div>
						<div class="ice-caption-content">
							<div class="ice-infor">
								<div class="ice-title">
									<?php if($params->get('show_readmore','0')) { ?>
										<a href="<?php echo $item->link?>">
											<?php echo $item->title;?>
										</a>
									<?php } else { ?>
										<?php echo $item->title;?>
									<?php }?>
								 </div>
								<div class="ice-desc">
								<?php echo strip_tags($item->description); ?>
								<?php if($params->get('show_readmore','0')) : ?>
									&nbsp;<a href="<?php echo $item->link?>"><?php echo JText::_("Read_more");?></a> 
								<?php endif; ?>
								</div>
							</div>
						</div>
					</div>	
					<?php if($params->get('show_readmore','0')) : ?>
					 </a>
					 <?php endif; ?>
				</div>
			</div>
		<?php endforeach; ?>
		</div>
	</div>
</div>	