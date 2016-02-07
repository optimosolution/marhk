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
$show_preview = $params->get("ip_show_preview",1);
$previewWidth = $params->get("ip_preview_width",200);
$previewHeight = $params->get("ip_preview_height",200);
$show_product_image = $params->get("ip_show_image",1);
$show_description = $params->get("ip_show_previewtext",1);
$show_listoffice = $params->get("ip_show_office", 1);
$show_stype = $params->get("ip_show_saletype", 1);
$show_price = $params->get("ip_show_price", 1);
$show_original_price = $params->get("ip_show_originalprice", 1);
$ip_show_category = $params->get("ip_show_category", 1);
$ip_show_agents = $params->get("ip_show_agent", 1);
$show_beds = $params->get("ip_show_beds", 1);
$show_baths = $params->get("ip_show_baths", 1);
$show_surface = $params->get("ip_show_surface", 1);
$show_lottype = $params->get("ip_show_lottype", 1);
$show_street_number = $params->get("ip_show_streetnumber",1);
$show_street = $params->get("ip_show_street",1);
$show_city = $params->get("ip_show_city",1);
$show_postcode = $params->get("ip_show_postcode",1);
$show_state = $params->get("ip_show_state",1);
$show_country = $params->get("ip_show_country",1);
$show_province = $params->get("ip_show_province",1);
?>

<?php for( $i=$limitstart; $i< $limit; $i++) : ?>
		<?php 
				$item = isset( $list[ $i ] )?$list[ $i ]:null;
				if( $item ):
				 /* BANNER DISPLAY */
				if($params->get('ip_show_banner', 1) == 1){
					$new = ipropertyHTML::isNew($item->created, $settings->new_days);
					$updated = ipropertyHTML::isNew($item->modified, $settings->updated_days);
					$banner_display = ipropertyHTML::displayBanners($item->stype, $new, JURI::root(true), $settings, $updated);
				}else{
					$banner_display = '';
				}
		?>
        	<h4 class="toggler <?php echo $iceaccordion_toggler ?>">
			<span class="<?php echo $show_preview?'iceAccordionTip':''; ?>" width="<?php echo $previewWidth; ?>" height="<?php echo $previewHeight;?>" rel="<?php echo $show_preview?$item->thumbnail:'';?>" title="<?php echo  $show_preview?$item->title:'';?>"><span><?php echo $item->title ?></span></span></h4>
				<div class="accordion_content <?php echo $iceaccordion_content ?>">
                	<div class="joomshopping_padding padding">
					<div class="<?php echo $show_preview?'iceAccordionTip':''; ?>" width="<?php echo $previewWidth; ?>" height="<?php echo $previewHeight;?>" rel="<?php echo $show_preview?$item->thumbnail:'';?>" title="<?php echo  $show_preview?$item->title:'';?>">

					<?php if($show_product_image): ?>
					<div class="ip_featured_thumb" style="width: <?php echo $mainWidth; ?> !important; height: <?php echo $mainHeight; ?> !important; ">
					<?php if( $params->get('show_readmore','0') ) : ?>
                          <a <?php echo $target;?>  href="<?php echo $item->link;?>" title="<?php echo $item->title;?>">
						  <?php endif; ?>
						  
						 	<?php echo $item->mainImage.$banner_display; ?>
                          
                          <?php if( $params->get('show_readmore','0') ) : ?>
                          </a>
						 <?php endif; ?>
                         </div>
					<?php endif; ?>
                    </div>
					<div class="ip_property">
						<?php if($show_beds):?>
							<strong><?php echo JText::_("IP_BEDS");?></strong> <?php echo $item->beds; ?>&nbsp;
						<?php endif; ?>
						<?php if($show_baths):?>
							<strong><?php echo JText::_("IP_BATHS");?></strong> <?php echo $item->baths; ?>&nbsp;
						<?php endif; ?>
						<?php if($show_surface):?>
							<strong><?php echo JText::_("IP_SURFACE");?></strong> <?php echo $item->sqft; ?>&nbsp;
						<?php endif; ?>
						<?php if($show_lottype):?>
							<strong><?php echo JText::_("IP_LOTTYPE");?></strong> <?php echo $item->lot_type; ?>
						<?php endif; ?>
					</div>
					<?php if($show_description): ?>
						<div class="description"><?php echo $item->description; ?></div>
					<?php endif; ?>
					<?php if($show_original_price || $show_price): ?>
						<div class="ip_price">
							 <?php if($show_original_price): ?>
								<span style="text-decoration: line-through;" class="ip_slashprice"><?php echo $item->price2; ?></span>
							<?php endif; ?>
							<?php if($show_price): ?>
								<span class="ip_newprice"><?php echo $item->price; ?></span>
							<?php endif; ?>
						</div>
                    <?php endif; ?>
					<?php if( $params->get('show_readmore','0') ) : ?>
                    	 <p class="readmore">
                          <a <?php echo $target;?>  href="<?php echo $item->link;?>" title="<?php echo $item->title;?>"><?php echo JText::_('READ_MORE');?></a>
                          </p>
					<?php endif; ?>
					 <div class="ice_gaddress">
						<?php 
										if($show_street_number){
											echo '<strong>'.JText::_("LOF_STREET_NUMBER").'</strong>&nbsp;'.$item->street_num."<br/>";
										}
										if($show_street){
											echo '<strong>'.JText::_("LOF_STREET").'</strong>&nbsp;'.$item->street."<br/>";
										}
										if($show_city){
											echo '<strong>'.JText::_("LOF_CITY").'</strong>&nbsp;'.$item->city."<br/>";
										}
										if($show_postcode){
											echo '<strong>'.JText::_("LOF_POSTALCODE").'</strong>&nbsp;'.$item->postalcode."<br/>";
										}
										if($show_state){
											echo '<strong>'.JText::_("LOF_STATE").'</strong>&nbsp;'.$item->state."<br/>";
										}
										if($show_province ){
											echo '<strong>'.JText::_("LOF_PROVINCE").'</strong>&nbsp;'.$item->province."<br/>";
										}
										if($show_country){
											echo '<strong>'.JText::_("LOF_COUNTRY").'</strong>&nbsp;'.$item->country;
										}
						?>
					 </div>
					   <div class="more_info">
						<?php if($ip_show_category && !empty($item->category) ): ?>
							<b class="ip_category"><?php echo JText::_("IP_CATEGORIES");?></b> &nbsp;<?php echo $item->category; ?><br/>
						<?php endif; ?>
						<?php if($ip_show_agents): ?>
							<b class="ip_agent"><?php echo JText::_("IP_AGENTS");?></b>&nbsp;<?php echo $item->agent_name; ?><br/>
						<?php endif; ?>
					   </div>
						<div class="ip_smallfont">
						<?php if($show_listoffice):
							echo JText::sprintf("LISTED_OFFICE", $item->listing_office,$item->created); 
						 endif;
						 ?>
						<?php if( $show_stype ):
							echo "[".$item->stype_2."]";
						endif;?>
						</div>
					
                    </div>
                </div>
		<?php endif; ?>
        <?php endfor; ?>