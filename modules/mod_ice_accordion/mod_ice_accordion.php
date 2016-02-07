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

if( !defined('PhpThumbFactoryLoaded') ) {
  require_once dirname(__FILE__).DS.'libs'.DS.'phpthumb'.DS.'ThumbLib.inc.php';
  define('PhpThumbFactoryLoaded',1);
}

// Include the syndicate functions only once
require_once dirname(__FILE__).DS.'helper.php';
if( !modIceAccordion::checkActualCat( $module->id, $params) ){
	$module->showtitle=0;
	//echo JText::_("THIS_PAGE_IS_NOT_PRODUCT_DETAIL");
}
else{
	$list = modIceAccordion::getList( $params );
	if(empty($list)){
		echo JText::_("THIS_CATE_DONT_HAVE_PRODUCTS");
	}
	else{
		$jshopConfig = null;
		if(class_exists( "JSFactory")){
			$jshopConfig = &JSFactory::getConfig();
			JSFactory::loadCssFiles();
		}

		$group 			= $params->get( 'data_source','content' );
		$tmp 		 	= $params->get( 'module_height', 'auto' );
		$moduleHeight   =  ( $tmp=='auto' ) ? 'auto' : (int)$tmp.'px';
		$tmp 			= $params->get( 'module_width', 'auto' );
		$moduleWidth    =  ( $tmp=='auto') ? 'auto': (int)$tmp.'px';
		$themeClass 	= $params->get( 'theme' , '');
		$openTarget 	= $params->get( 'open_target', 'parent' );
		$class 			= !$params->get( 'navigator_pos', 0 ) ? '':'ice-'.$params->get( 'navigator_pos', 0 );
		$theme		    =  $params->get( 'theme', '' );
				$target = $params->get('open_target','_parent') != 'modalbox'
									? 'target="'.$params->get('open_target','_parent').'"'
									: 'rel="'.$params->get('modal_rel','width:800,height:350').'" class="mb"'; 
		//Allow multiplie Id's
		if (!isset($GLOBALS['add_iceaccordion_toggler'])) { $GLOBALS['add_iceaccordion_toggler'] = 1; } else { $GLOBALS['add_iceaccordion_toggler']++; }
		if (!isset($GLOBALS['add_iceaccordion_content'])) { $GLOBALS['add_iceaccordion_content'] = 1; } else { $GLOBALS['add_iceaccordion_content']++; }


		// Variables
		$mod_url  		 								= JURI::base() . 'modules/mod_ice_accordion/';
		$style           								= $params->get('style', 'default');

		$isThumb       = $params->get( 'auto_renderthumb',1);
		$itemContent= $isThumb==1?'desc-image':'introtext';
		$iceaccordion_toggler   						= 'iceaccordion_toggler_' . $GLOBALS['add_iceaccordion_toggler'];
		$iceaccordion_content   						= 'iceaccordion_content_' . $GLOBALS['add_iceaccordion_content'];
		$iceaccordion_activecolor   					= $params->get('iceaccordion_activecolor', '222');
		$iceaccordion_inactivecolor   					= $params->get('iceaccordion_inactivecolor', '888');
		$item_heading = $params->get('item_heading', 3);
		/*Paging*/
		$module_id = JRequest::getVar("moduleId",0);
		$layout = JRequest::getVar("layout","");
		$page = JRequest::getVar("p", 1);
		$tmp_number_page = $params->get('number_page', '1');

		$number_show_on_page = count( $list ) / $tmp_number_page;
		$number_show_on_page = round( $number_show_on_page );
		if( empty($number_show_on_page)){
			$number_show_on_page = 1;
		}
		$countlist = count( $list );
		$limitstart = $number_show_on_page * ( $page - 1 );
		$limit = $number_show_on_page * $page;
		$limit = $limit > $countlist? $countlist: $limit;
		$number_page = count( $list ) / $number_show_on_page;
		$number_page = round( $number_page );
		$number_page = $number_page > (int) $tmp_number_page?$tmp_number_page: $number_page;
		$pagin = "";

		/*Joom shopping config*/
		$show_preview = $params->get("show_preview",1);
		$show_image_label = $params->get("show_image_label",1);
		$show_rating = $params->get("show_rating",1);
		$show_product_image = $params->get("show_product_image",1);
		$show_description = $params->get("show_description",1);
		$show_old_price = $params->get("show_old_price",1);
		$show_price = $params->get("show_price",1);
		
		$mainWidth    = (int)$params->get( 'main_width', 200 );
		$mainWidth = $mainWidth !="auto"?(int)$mainWidth."px":$mainWidth;
		$mainHeight   = (int)$params->get( 'main_height', 210 );
		$mainHeight = $mainHeight !="auto"?(int)$mainHeight."px":$mainHeight;
		
		$previewWidth    = (int)$params->get( 'preview_width', 200 );
		$previewWidth = $previewWidth !="auto"?(int)$previewWidth."px":$previewWidth;
		$previewHeight   = (int)$params->get( 'preview_height', 210 );
		$previewHeight = $previewHeight !="auto"?(int)$previewHeight."px":$previewHeight;
		$hideArrows = $params->get('hide_arrows', 0);
		$hideArrows = $hideArrows == 1?true:false;
		
		$item_layout = "_items";
		if($group == "joomshopping"){
			$item_layout = "_products";
		}
		elseif($group == "ip"){
			$settings           = ipropertyAdmin::config();
			$item_layout = "_properties";
		}
		if($params->get('number_page', '1') > 1){
			$paging = modIceAccordion::getPaging( $number_page, $page);
		}
		else{
			$paging = "";
		}
		/*End Paging*/
		if(modIceAccordion::checkIceAjax() ){
			$lang_tag = JRequest::getVar("lang","en-GB");
			$lang =& JFactory::getLanguage();
			$lang->load( "mod_ice_accordion",JPATH_SITE, $lang_tag, true );
		}
		
		$item_path = modIceAccordion::getLayoutByTheme($module, $theme, $item_layout);
		if( $module_id == $module->id && $layout == $item_layout ){
			require_once( $item_path );
		}
		else{
			$lang =& JFactory::getLanguage();
			$lang_tag =  $lang->getTag();
			// load custom theme
			if( $theme && $theme != -1 ) {
				require( modIceAccordion::getLayoutByTheme($module, $theme) );
			} else {
				require( JModuleHelper::getLayoutPath($module->module) );	
			}
			?>
			<script type="text/javascript">
				var start_index = <?php echo $params->get("default_item", -9);?>;
				start_index = start_index - 1;
				var current_page = <?php echo (int) $page;  ?>;
				var number_page = <?php echo (int) $number_page; ?>;
				var ajax_url = "<?php echo JURI::base()."modules/mod_ice_accordion/ajax.php?moduleId=".$module->id."&layout=".$item_layout."&type=ice_accordion&lang=".$lang_tag;?>";
				var listpage = $("iceaccordion<?php echo $module->id; ?>").getElements(".iceaccordion-paging li");
				function addPagingEvent(){
					if(listpage && number_page > 1){
						listpage.each( function(el, index){
							el.addEvent("click", function( event ){
									event.stop();
									if( (index+1) != current_page){
										getAccordion( index + 1 );
										updateActiveClass( listpage, index );
									}
								});
						});
						if( $("iceaccordion<?php echo $module->id; ?>").getElement(".iceaccordion-prev") ){
							$("iceaccordion<?php echo $module->id; ?>").getElement(".iceaccordion-prev").addEvent( "click", function( event ){
								index = current_page - 1;
								if(index > 0){
									getAccordion( index );
									updateActiveClass( listpage, index -1);
								}
								
							});
						}
						if( $("iceaccordion<?php echo $module->id; ?>").getElement(".iceaccordion-next") ){
							$("iceaccordion<?php echo $module->id; ?>").getElement(".iceaccordion-next").addEvent( "click", function( event ){
								index = current_page + 1;
								if(index <= number_page){
									getAccordion( index );
									updateActiveClass( listpage, index - 1  );
								}
							});
						}
						updateClassArrows( current_page );
					}
					
				}
				function getAccordion( nextpage ){
					updateClassArrows( nextpage );
					var blockHidden = $("iceaccordion<?php echo $module->id; ?>").getElement(".iceaccordion-hidden");
					if( $(blockHidden).getElement(".page-"+nextpage)){
						var htmlHidden = $(blockHidden).getElement(".page-"+nextpage).get("html");
						current_page = nextpage; 
						$("iceaccordion<?php echo $module->id; ?>").getElement(".iceaccordion").set("html", htmlHidden);
						var myAccordion = new Accordion( $("iceaccordion<?php echo $module->id; ?>").getElement(".iceaccordion"), '.toggler', '.accordion_content', {
							opacity: false,
							alwaysHide:true,
							display: start_index,
							onActive: function(toggler, element){
								toggler.addClass('open');
							},
							onBackground: function(toggler, element){
								toggler.removeClass('open');
							}
						});
						imageAccordionPreview( $("iceaccordion<?php echo $module->id; ?>") );
					}
					else{
						$("iceaccordion<?php echo $module->id; ?>").getElement(".iceaccordion-loading").setStyle("display","block");
						var req =new Request({
										  method: 'get',
										  url: ajax_url,
										  data: { 'p' : nextpage <?php echo modIceAccordion::getAjaxData( $params ); ?> },
										  onComplete: function(response) {
												$("iceaccordion<?php echo $module->id; ?>").getElement(".iceaccordion-loading").setStyle("display","none");
												if(response !=""){
														current_page = nextpage; $("iceaccordion<?php echo $module->id; ?>").getElement(".iceaccordion").set("html", response);
														var myAccordion = new Accordion( $("iceaccordion<?php echo $module->id; ?>").getElement(".iceaccordion"), '.toggler', '.accordion_content', {
															opacity: false,
															alwaysHide:true,
															display: start_index,
															onActive: function(toggler, element){
																toggler.addClass('open');
															},
															onBackground: function(toggler, element){
																toggler.removeClass('open');
															}
														});
														imageAccordionPreview( $("iceaccordion<?php echo $module->id; ?>") );
														$(blockHidden).set("html", $(blockHidden).get("html")+'<div class="page-'+nextpage+'">'+response+'</div>');
												}
												
											}
										}).send();
					}
				}
				function updateClassArrows( currentIndex ){
					var prev = $("iceaccordion<?php echo $module->id; ?>").getElement(".iceaccordion-prev");
					var next = $("iceaccordion<?php echo $module->id; ?>").getElement(".iceaccordion-next");
					if( currentIndex == 1){
						prev.addClass("disabled");
						next.removeClass("disabled");
					}
					else if( currentIndex == number_page ){
						prev.removeClass("disabled");
						next.addClass("disabled");
					}
					else{
						prev.removeClass("disabled");
						next.removeClass("disabled");
					}
					
				}
				function updateActiveClass( listpage, nextpage ){
					
					if( listpage[ nextpage ] ){
						listpage.removeClass("active");
						listpage[ nextpage ].addClass("active");
					}
					
				}
				window.addEvent('load', function() {
					imageAccordionPreview( $("iceaccordion<?php echo $module->id; ?>") );
				});
			</script>
			<?php
				modIceAccordion::loadMediaFiles( $params, $module, $theme );
		}
		if(!empty($paging) && modIceAccordion::checkIceAjax() ){
			exit();
		}
	}
}
?>
