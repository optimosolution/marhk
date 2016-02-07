<?php
// No direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

/**
 * $ModDesc
 * 
 * @version   $Id: helper.php $Revision
 * @package   modules
 * @subpackage  $Subpackage
 * @copyright Copyright (C) May 2010 LandOfCoder.com <@emai:landofcoder@gmail.com>. All rights reserved.
 * @website   htt://landofcoder.com
 * @license   GNU General Public License version 2
 */
if( !class_exists('IceGroupAccordionJoomshopping') ) {
  /**
   * IceGroupAccordionJoomshopping Class  extends the LofSliderGroupBase Class
   */   
   class IceGroupAccordionJoomshopping extends IceGroupBase{
    
    /**
     * @var string $__name 
     *
     * @access private;
     */
    var $__name = 'joomshopping';
    
    /**
     * @var static $regex is a pattern using for maching imag tag.
     * 
     * @access public.
     */
    static $regex = "#<img.+src\s*=\s*\"([^\"]*)\"[^\>]*\>#iU"; 
    
    /**
     * override get List of Item by the module's parameters
     */
    public function getListByParameters( $params ){
      if( !IceGroupAccordionJoomshopping::isJshoppingExisted() ){
        return array();
      }
      return $this->__getList( $params );
    }
    
    
    /**
     * check Jshopping Existed ?
     */
    public function isJshoppingExisted(){
      return is_file( JPATH_SITE.DS.  "components" . DS . "com_jshopping" . DS . "jshopping.php" ); 
    }
    
	function getOrdering( $string = ""){
		$ordering = "product_id";
		$dir = "ASC";
		if( !empty($string )){
				$tmp = explode("__", $string);	
				$ordering = $string;
				if( count($tmp) == 2){
					$ordering = $tmp[0];
					$dir = $tmp[1];
				}
		}
		
		$order["ordering"] = $ordering;
		$order["dir"] = $dir;	
		return $order;
	}
    /**
     * get the list of jshopping items
     * 
     * @param JParameter $params;
     * @return Array
     */
    public function __getList( $params ){
	  $jshopConfig = &JSFactory::getConfig();
      $lang = &JSFactory::getLang();
      $mainframe = &JFactory::getApplication();
	  $noimage = "noimage.gif";
	  $order_complate_id = 7;
	  
      $titleMaxChars      = $params->get( 'title_max_chars', '100' );
      $openTarget    = $params->get( 'open_target', 'parent' );
      $descriptionMaxChars = $params->get( 'description_max_chars', 100 );
      $condition     = $this->buildConditionQuery( $params );

      $ordering      = $params->get( 'sort_product', 'date_asc');
      $limit         = $params->get( 'limit_items',  5 );
      $orders      = $this->getOrdering( $ordering );
	  $dir = $orders["dir"];
	  $ordering = $orders["ordering"];
      $my          = &JFactory::getUser();
      $aid         = $my->get( 'aid', 0 );
      $thumbWidth    = (int)$params->get( 'preview_width', 200 );
      $thumbHeight   = (int)$params->get( 'preview_height', 210 );
      $imageHeight   = (int)$params->get( 'main_height', 300 ) ;
      $imageWidth    = (int)$params->get( 'main_width', 660 ) ;
	  $show_preview = $params->get( 'show_preview', 1);
      $isThumb       = $params->get( 'auto_renderthumb',1);
	  $image_quanlity = $params->get('image_quanlity', 100);
      $isStripedTags = $params->get( 'auto_strip_tags', 0 );
      $extraURL     = $params->get('open_target')!='modalbox'?'':'&tmpl=component'; 
      $db     = &JFactory::getDBO();
      $date   =& JFactory::getDate();
      $now    = $date->toMySQL();
      
       $mysqlversion = getMysqlVersion();
		if ($mysqlversion < "4.1.0"){
			$spec_where = "cat.`".$lang->get('name')."` AS namescats";
		}else{
			$spec_where = "GROUP_CONCAT(cat.`".$lang->get('name')."` SEPARATOR '<br>') AS namescats";
		}
		$query_join = "";
		$query_filed = "";
		/*Use this code for check ordering*/
		switch( $ordering ){
			case 'date':
				$ordering = "pr.product_date_added ".$dir;
			break;
			case 'price':
				$ordering = "pr.product_price ".$dir;
			break;
			case 'name':
				$ordering = "`name` ".$dir;
			break;
			case 'most_sold':
				$ordering = " oh.order_status_id DESC,op.product_quantity DESC";
				$query_join .= " LEFT JOIN `#__jshopping_order_item` AS op ON op.product_id = pr.product_id ";
				$query_join .= " LEFT JOIN `#__jshopping_order_history` AS oh ON oh.order_id = op.order_id AND oh.order_status_id =".$order_complate_id." ";
				$query_filed .=" ,op.order_id";
				/*$condition .= " AND oh.order_status_id =".$order_complate_id." ";*/
			break;
			case 'latest_sold':
				$ordering = " oh.order_status_id DESC, oh.status_date_added DESC";
				$query_join .= " LEFT JOIN `#__jshopping_order_item` AS op ON op.product_id = pr.product_id ";
				$query_join .= " LEFT JOIN `#__jshopping_order_history` AS oh ON oh.order_id = op.order_id AND oh.order_status_id =".$order_complate_id." ";
				$query_filed .=" ,op.order_id";
				/*$condition .= " AND oh.order_status_id = ".$order_complate_id." ";*/
			break;
			case 'most_rate':
				$ordering = " pr.average_rating DESC";
			break;
			case 'most_comment':
				$ordering = " pr.reviews_count DESC";
			break;
			case 'random':
				$ordering = " RAND()";
			break;
		}
		/*End*/
		$query = "SELECT pr.product_id, pr.product_publish,pr.average_rating, pr.reviews_count, pr.`".$lang->get('name')."` as `name`, pr.`".$lang->get('description')."` as description, pr.`".$lang->get('short_description')."` as short_description, man.`".$lang->get('name')."` as man_name, ".$spec_where.", pr.product_ean as ean, pr.product_quantity as qty, pr.product_thumb_image as image,pr.product_thumb_image,pr.product_full_image, pr.product_price,pr.label_id, pr_cat.category_id, pr.hits, pr.unlimited, pr.product_date_added, pr.product_old_price $query_filed  FROM `#__jshopping_products` AS pr 
				  LEFT JOIN `#__jshopping_products_to_categories` AS pr_cat USING (product_id)
				  LEFT JOIN `#__jshopping_categories` AS cat ON pr_cat.category_id=cat.category_id
				  LEFT JOIN `#__jshopping_manufacturers` AS man ON pr.product_manufacturer_id=man.manufacturer_id
				  $query_join
				  WHERE 1 ".$condition;
		
      $query .=  " GROUP BY pr.product_id". ' ORDER BY ' . $ordering;
	  
      $query .=  $limit ? ' LIMIT ' . $limit : '';
	  /*
	 echo nl2br(str_replace('#__', 'jos_', $query));
	 die();
	 */
      $db->setQuery($query);
      $data = $db->loadObjectlist();
      if( empty($data) ) return array();
	 $check = array();
	 $products = array();
      foreach( $data as $key => $item ){
		if(in_array($item->product_id, $check)){
			continue;
		}
        $item->link = SEFLink('index.php?option=com_jshopping&controller=product&task=view&category_id=' . $item->category_id.'&product_id=' . $item->product_id ,1);
        $item->date = JHtml::_('date', $item->created, JText::_('DATE_FORMAT_LC2')); 
        $item->title = $item->name;
        $item->subtitle = self::substring( $item->title, $titleMaxChars );
        $item->description = self::substring( $item->short_description, $descriptionMaxChars,true);
		$item->product_price = formatprice( $item->product_price );
		$item->product_old_price = $item->product_old_price > 0?formatprice( $item->product_old_price):"";
		$item->product_full_image = !empty ($item->product_full_image)? $item->product_full_image: $noimage;
        $item->mainImage = $jshopConfig->image_product_live_path."/".$item->product_full_image;
		$item->thumbnail =  $item->mainImage;
		$item->introtext = $item->description;
		$item->image_label = "";
		$item->review = "";
		$item->product_full_image = $item->mainImage;
		
        if( $item->mainImage &&  $image=$this->renderThumb($item->mainImage, $imageWidth, $imageHeight, $item->name, $isThumb, $image_quanlity ) ){
          $item->mainImage = $image;
        }
		if( $show_preview ){
			
			if( $item->thumbnail &&  $image = $this->renderThumb($item->thumbnail, $thumbWidth, $thumbHeight, $item->name, $isThumb, $image_quanlity, true ) ){
			  $item->thumbnail = $image;
			}
			
		}
		$check[] = $item->product_id;
		$products[] = $item;
      }
      return $products; 
    }
    
    /**
     * build condition query base parameter  
     * 
     * @param JParameter $params;
     * @return string.
     */
    public  function buildConditionQuery( $params ){
      $source = trim($params->get( 'source_from', 'cat_ids' ) );
	  $filter_type = $params->get( 'filtering_type','1');
	  $lang = &JSFactory::getLang();
      if( $source == 'cat_ids' ){
        $catids = $params->get( 'jcat_ids','');
        $catids = !is_array($catids) ? $catids : implode(",",$catids);
		if( empty( $catids ) ){
          return '';
        }
		if($filter_type){
			$condition = ' AND  pr_cat.category_id IN( '.$catids.' )';
		}
		else{
			$condition = ' AND pr_cat.category_id NOT IN( '.$catids.' )';
		}
      }
	  elseif( $source == "product_ids"){
		 $ids = explode(',',$params->get( 'jproduct_ids',''));  
        $tmp = array();
        foreach( $ids as $id ){
          $tmp[] = (int) trim($id);
        }
		if($filter_type){
			$condition = ' AND pr.product_id IN( '.implode( ",", $tmp ).' )';
		}
		else{
			$condition = ' AND pr.product_id NOT IN( '.implode(",", $tmp).' )';
		}
	  }
	  elseif( $source == "product_label"){
		 $product_label = $params->get("jproduct_label", "");
		$product_label = !is_array($product_label) ? $product_label : implode(",",$product_label);
		if(empty($product_label)){
			return "";
		}
		if($filter_type){
			$condition = ' AND pr.label_id IN( '.$product_label.' )';
		}
		else{
			$condition = ' AND pr.label_id NOT IN( '.$product_label.' )';
		}
	  }
	  elseif( $source == "manufactures"){
		$manufactures = $params->get("jmanufactures", "");
		$manufactures = !is_array($manufactures) ? $manufactures : implode(",",$manufactures);
		if(empty($manufactures)){
			return "";
		}
		if($filter_type){
			$condition = ' AND pr.product_manufacturer_id IN( '.$manufactures.' )';
		}
		else{
			$condition = ' AND pr.product_manufacturer_id NOT IN( '.$manufactures.' )';
		}
	  }
	  else {
		$controller = JRequest::getCmd('controller','');
		$task = JRequest::getCmd('task','');
		$product_id = JRequest::getCmd('product_id',0);
		$category_id = JRequest::getCmd('category_id', 0);
		if( ($controller == "product" || $controller == "category") && $task == "view" && ( !empty($category_id) || !empty($product_id))){
			$db = &JFactory::getDBO();
			if(!empty($product_id)){
				$query = "SELECT category_id FROM #__jshopping_products_to_categories WHERE product_id=".$product_id;
				$db->setQuery($query);
				$rows = $db->loadObjectList();
				if(is_array( $rows)){
					$tmp = array();
					foreach($rows as $row){
						$tmp[] = (int) $row->category_id;
					}
				}
			}
			else{
				$tmp[] = $category_id;
				/*Select children category ids*/
				$query = "SELECT `".$lang->get('name')."` as name, category_id, category_parent_id, category_publish FROM `#__jshopping_categories`
								where category_publish = '1' ORDER BY category_parent_id, ordering";
				$db->setQuery($query);
				$all_cats = $db->loadObjectList();
				
				if(count($all_cats)) {
					foreach ($all_cats as $key => $value) {
						if(!empty( $value->category_parent_id ) && in_array($value->category_parent_id, $tmp)){
							$tmp[] = $value->category_id;
						}
					}
				}
			}
			if($filter_type){
				$condition = ' AND  pr_cat.category_id IN( '.implode(",",$tmp).' ) AND pr.product_id <>'.$product_id;
			}
			else{
				$condition = ' AND  pr_cat.category_id NOT IN( '.implode(",",$tmp).' ) AND pr.product_id <>'.$product_id;
			}
		}
		else{
			return "";
		}
      }
      return $condition;
    }
  }
}
?>
