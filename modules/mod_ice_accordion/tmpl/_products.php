<?php
/**
 * IceAccordion Extension for Joomla 1.6 By IceTheme
 * 
 * 
 * @copyright	Copyright (C) 2008 - 2011 IceTheme.com. All rights reserved.
 * @license		GNU General Public License version 2
 * 
 * @Website 	http://www.icetheme.com/Joomla-Extensions/iceaccordion.html
 * @Support 	http://www.icetheme.com/Forums/IceAccordion/
 *
 */
 

/* no direct access*/
defined('_JEXEC') or die;
?>
<?php for( $i=$limitstart; $i< $limit; $i++) : ?>
		<?php 
				$item = isset( $list[ $i ] )?$list[ $i ]:null;
				if( $item ):
		?>
        	<h4 class="toggler <?php echo $iceaccordion_toggler ?>">
			<span class="<?php echo $show_preview?'iceAccordionTip':''; ?>" width="<?php echo $previewWidth; ?>" height="<?php echo $previewHeight;?>" rel="<?php echo $show_preview?$item->thumbnail:'';?>" title="<?php echo  $show_preview?$item->title:'';?>"><span><?php echo $item->title ?></span></span></h4>
				<div class="accordion_content <?php echo $iceaccordion_content ?>">
                	<div class="joomshopping_padding padding">
					
					<div class="<?php echo $show_preview?'iceAccordionTip':''; ?>" width="<?php echo $previewWidth; ?>" height="<?php echo $previewHeight;?>" rel="<?php echo $show_preview?$item->thumbnail:'';?>" title="<?php echo  $show_preview?$item->title:'';?>">
					
					<?php
						if($show_image_label): ?>
							 <?php if ($item->label_id && getNameImageLabel($item->label_id)){?>
                                    <div class="product_label">
                                        <img src="<?php echo $jshopConfig->image_labels_live_path."/".getNameImageLabel($item->label_id); ?>" alt="<?php echo getNameImageLabel($item->label_id, 2)?>" />
                                    </div>
                             <?php }?>
					<?php
						endif;
					?>
					<?php if($show_product_image): ?>
					<?php if( $params->get('show_readmore','0') ) : ?>
                          <a <?php echo $target;?>  href="<?php echo $item->link;?>" title="<?php echo $item->title;?>">
						  <?php endif; ?>
						  
						 	<?php echo $item->mainImage; ?>
                          
                          <?php if( $params->get('show_readmore','0') ) : ?>
                          </a>
						 <?php endif; ?>
                         
					<?php endif; ?>
                    
                    </div>
				
					<?php if( $show_old_price ): ?>
						<div class="jshop_old_price"><?php echo '<span>'.$item->product_old_price.'</span>'; ?></div>
					<?php endif; ?>
					<?php if( $show_price ): ?>
						<div class="jshop_price"><?php echo $item->product_price; ?></div>
					<?php endif; ?>
					
					<?php if($show_description): ?>
						<div class="description"><?php echo $item->description; ?></div>
					<?php endif; ?>
                    
                    
					<?php if( $show_rating ): ?>
                         <table class="review_mark"><tr><td>                            
                            <?php print showMarkStar($item->average_rating);?>
                            </td></tr></table>
                            <div class="count_commentar">
                                <?php print sprintf(_JSHOP_X_COMENTAR, $item->reviews_count);?>
                            </div>
					<?php endif; ?>
					<?php if( $params->get('show_readmore','0') ) : ?>
                    	 <p class="readmore">
                          <a <?php echo $target;?>  href="<?php echo $item->link;?>" title="<?php echo $item->title;?>"><?php echo JText::_('READ_MORE');?></a>
                          </p>
					<?php endif; ?>
                    </div>
                </div>
		<?php endif; ?>
        <?php endfor; ?>