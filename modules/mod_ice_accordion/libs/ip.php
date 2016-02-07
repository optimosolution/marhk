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
 if(file_exists(JPATH_SITE.DS.'components'.DS.'com_iproperty'.DS.'iproperty.php')){
	require_once (JPATH_SITE.DS.'components'.DS.'com_iproperty'.DS.'helpers'.DS.'html.helper.php' );
	require_once(JPATH_SITE.DS.'components'.DS.'com_iproperty'.DS.'helpers'.DS.'property.php');
	require_once(JPATH_SITE.DS.'components'.DS.'com_iproperty'.DS.'helpers'.DS.'route.php');
	require_once(JPATH_SITE.DS.'components'.DS.'com_iproperty'.DS.'helpers'.DS.'query.php');
	require_once(JPATH_ADMINISTRATOR.DS.'components'.DS.'com_iproperty'.DS.'classes'.DS.'admin.class.php');
	require_once(JPATH_SITE.DS.'modules'.DS.'mod_ice_accordion'.DS.'libs'.DS.'ip_helpers'.DS.'property.php');
}
$lang =& JFactory::getLanguage();
$lang->load( "com_iproperty" );

if( !class_exists('IceGroupAccordionIp') ) {
  /**
   * IceGroupAccordionJoomshopping Class  extends the LofSliderGroupBase Class
   */   
   class IceGroupAccordionIp extends IceGroupBase{
    
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
      if( !IceGroupAccordionIp::isIpExisted() ){
        return array();
      }
      return $this->__getList( $params );
    }
    
    
    /**
     * check Jshopping Existed ?
     */
    public function isIpExisted(){
      return is_file( JPATH_SITE.DS.  "components" . DS . "com_iproperty" . DS . "iproperty.php" ); 
    }
    
	function getOrdering( $string = ""){
		$ordering = "p.hits";
		$dir = "DESC";
		if( !empty($string )){
				$tmp = explode("__", $string);	
				$ordering = $string;
				if( count($tmp) == 2){
					$ordering = "p.".$tmp[0];
					$dir = $tmp[1];
				}
		}
		
		$order["ordering"] = $ordering;
		$order["dir"] = $dir;	
		return $order;
	}
	
	function getPropertiesList( $where, $limitstart=0, $limit=9999, $sort = 'p.title', $order = 'ASC' )
	{
		$db =& JFactory::getDBO();
        $property = new lofAccordionHelperProperty($db);
        $property->setType('properties');
        $property->setWhere( $where );
        $property->setOrderBy( $sort, $order );
        $properties = $property->getProperty($limitstart,$limit);
        return $properties;
	}
	function _getAgentsOfCompanies( $companies = ""){
		 $database =& JFactory::getDBO();
        $database->setQuery( "SELECT id FROM #__iproperty_agents WHERE company IN ( ".$companies." )" );
        $result = $database->loadObjectList();
		$return = array();
		if(!empty($result)){
			foreach( $result as $key=>$row){
				$return[] = $row->id;
			}
		}
        return implode(",", $return);
	}
    /**
     * get the list of jshopping items
     * 
     * @param JParameter $params;
     * @return Array
     */
    public function __getList( $params ){
      $mainframe = &JFactory::getApplication();
	  $noimage = "noimage.gif";
	  $order_complate_id = 7;
	  
	  
      $titleMaxChars      = $params->get( 'title_max_chars', '100' );
      $openTarget    = $params->get( 'open_target', 'parent' );
      $descriptionMaxChars = $params->get( 'description_max_chars', 100 );

      $ordering      = $params->get( 'ip_sort_product', 'hits__desc');
      $limit         = $params->get( 'limit_items',  5 );
      $orders      = $this->getOrdering( $ordering );
	  $dir = $orders["dir"];
	  $ordering = $orders["ordering"];
      $my          = &JFactory::getUser();
      $aid         = $my->get( 'aid', 0 );
      $thumbWidth    = (int)$params->get( 'ip_preview_width', 200 );
      $thumbHeight   = (int)$params->get( 'ip_preview_height', 210 );
      $imageHeight   = (int)$params->get( 'main_height', 300 ) ;
      $imageWidth    = (int)$params->get( 'main_width', 660 ) ;
	  $show_preview = $params->get( 'ip_show_preview', 1);
      $isThumb       = $params->get( 'auto_renderthumb',1);
	  $ip_show_office       = $params->get( 'ip_show_office',1);
	  $image_quanlity = $params->get('image_quanlity', 100);
      $isStripedTags = $params->get( 'auto_strip_tags', 0 );
	  $ip_show_stype = $params->get( 'ip_show_saletype', 1);
	  $show_country = $params->get( 'ip_show_country', 1);
      $extraURL     = $params->get('open_target')!='modalbox'?'':'&tmpl=component';
      $db     = &JFactory::getDBO();
      $date   =& JFactory::getDate();
      $now    = $date->toMySQL();
      
		$query_join = "";
		$query_filed = "";
		$sort = "";
		$where = array();
		$source = trim($params->get( 'ip_source_from', 'ip_cat_ids' ) );
		$filter_type = $params->get( 'ip_filtering_type','1');
		if( $source == "ip_cat_ids"){
			$catids = $params->get('ip_cat_ids');
			$catids = !is_array($catids) ? $catids : implode(",",$catids);
			if( !empty( $catids ) ){
				if( $filter_type ){
					$where[] = 'pm.cat_id IN ('.$catids.')';
				}
				else{
					$where[] = 'pm.cat_id NOT IN ('.$catids.')';
				}
			}
		}
		elseif( $source == "ip_agents"){
			$agents = $params->get("ip_agents");
			$agents = !is_array($agents) ? $agents : implode(",",$agents);
			if(!empty($agents)){
				if( $filter_type ){
					$where[] = 'am.agent_id IN ('.$agents.')';
				}
				else{
					$where[] = 'am.agent_id NOT IN ('.$agents.')';
				}
			}
		}
		elseif( $source == "ip_companies"){
			$companies = $params->get("ip_companies");
			$companies = !is_array($companies) ? $companies : implode(",",$companies);
			if(!empty($companies)){
				$agents = $this->_getAgentsOfCompanies( $companies );
				if(!empty($agents)){
					if( $filter_type ){
						$where[] = 'am.agent_id IN ('.$agents.')';
					}
					else{
						$where[] = 'am.agent_id NOT IN ('.$agents.')';
					}
				}
				/*
				if( $filter_type ){
					$where[] = 'p.listing_office IN ('.$companies.')';
				}
				else{
					$where[] = 'p.listing_office NOT IN ('.$companies.')';
				}
				*/
			}
		}
		
		/*Use this code for check ordering*/
		switch( $ordering ){
			case 'random':
				$ordering = " RAND()";
				$dir = "";
			break;
			default:
			break;
		}
		/*End*/
	  /*
	 echo nl2br(str_replace('#__', 'jos_', $query));
	 die();
	 */
	  $rows = IceGroupAccordionIp::getPropertiesList($where,0,$limit, $ordering, $dir);
      if( empty($rows) ) return array();
	 $check = array();
	 $products = array();
	 $lists = array();
	 $i = 0;
	 if( $rows ){
            foreach ( $rows as $row )
            {
                $available_cats = ipropertyHTML::getAvailableCats($row->id);
				$available_agents = ipropertyHTML::getAvailableAgents($row->id);
				if(!empty($available_agents)){
					$agent_names = array();
					foreach($available_agents as $agent){
						$agent_names[] = $agent->agent_name;
					}
					$lists[$i]->agent_name = implode(",", $agent_names);
				}
                $first_cat      = $available_cats[0];
				$lists[$i]->category = ipropertyHTML::getCatName( $first_cat );
				$lists[$i]->title 	= $row->street_address;
                $lists[$i]->link            =  JRoute::_(ipropertyHelperRoute::getPropertyRoute($row->id, $first_cat));
				$lists[$i]->link = str_replace("/component/","/", $lists[$i]->link);
                $lists[$i]->mainImage       = ipropertyHTML::getThumbnail($row->id, $lists[$i]->link, $row->street_address, $imageWidth, ' class="ip_popular_img"', '', false,false);
                $lists[$i]->street_address  = htmlspecialchars( $row->street_address );
				$lists[$i]->gbase_address = $row->gbase_address;
				$lists[$i]->street_num = $row->street_num;
				$lists[$i]->street = $row->street;
				$lists[$i]->postalcode = $row->zip;
				$lists[$i]->country = $row->country;
				if($show_country){
					$lists[$i]->country = ipropertyHTML::getCountryName( $row->country );
				}
                $lists[$i]->city            = htmlspecialchars( $row->city );
                $lists[$i]->state           = htmlspecialchars( ipropertyHTML::getStateName($row->locstate));
                $lists[$i]->province        = htmlspecialchars( $row->province );
                $lists[$i]->created         = $row->created;
                $lists[$i]->modified        = $row->modified;
                $lists[$i]->stype           = $row->stype;
				$lists[$i]->thumbnail =   $lists[$i]->mainImage;
				$lists[$i]->sqft = $row->sqft;
				$lists[$i]->baths = $row->baths;
				$lists[$i]->beds = $row->beds;
				$lists[$i]->lot_type = $row->lot_type;
				$lists[$i]->stype_freq = $row->stype_freq;
				$lists[$i]->stype = $row->stype;
				$lists[$i]->category = "";
				if($ip_show_office){
					$lists[$i]->listing_office = ipropertyHTML::getCompanyName($row->listing_office);
				}
				if($ip_show_stype){
					$stype = ipropertyHTML::get_stype( $row->stype );
					$lists[$i]->stype_2           = $stype;
				}

                $prepared_text = $row->short_description ? IceGroupAccordionIp::prepareContent($row->short_description, $descriptionMaxChars) : IceGroupAccordionIp::prepareContent($row->description, $descriptionMaxChars);
				$lists[$i]->price = $row->price;
				$lists[$i]->price2 = isset($row->price2)?$row->price2:$row->price;
                $lists[$i]->introtext = $prepared_text;
				
                $lists[$i]->introtext .= ' <a href="' . $lists[$i]->link . '">' . JTEXT::_('MOD_IP_POPULAR_READ_MORE') . '</a>';
				$lists[$i]->description = $prepared_text;
                $lists[$i]->formattedprice = $row->formattedprice;
				$lists[$i]->price2 =  ipropertyHTML::getFormattedPrice($lists[$i]->price2, $row->stype_freq, '', '', "", true);
				$lists[$i]->price =  ipropertyHTML::getFormattedPrice($lists[$i]->price, $row->stype_freq, '', '', "", true);

				if( $lists[$i]->mainImage &&  $image=$this->renderThumb($lists[$i]->mainImage, $imageWidth, $imageHeight, $lists[$i]->title, $isThumb, $image_quanlity ) ){
				  $lists[$i]->mainImage = $image;
				}
				if( $show_preview ){
					if( $lists[$i]->thumbnail &&  $image = $this->renderThumb($lists[$i]->thumbnail, $thumbWidth, $thumbHeight, $lists[$i]->title, $isThumb, $image_quanlity, true ) ){
						$lists[$i]->thumbnail = $image;
					}
					
				}
                $i++;

                $prepared_text = '';
            }
        }

      return $lists; 
    }
    function prepareContent( $text, $length=300 ) {
		// strips tags won't remove the actual jscript
		$text = preg_replace( "'<script[^>]*>.*?</script>'si", "", $text );
		$text = preg_replace( '/{.+?}/', '', $text);
		// replace line breaking tags with whitespace
		$text = preg_replace( "'<(br[^/>]*?/|hr[^/>]*?/|/(div|h[1-6]|li|p|td))>'si", ' ', $text );
		$text = strip_tags( $text );
		if (strlen($text) > $length) $text = substr($text, 0, $length) . "...";
		return $text;
	}
  }
}
?>
