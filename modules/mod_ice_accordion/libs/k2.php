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
if( !class_exists('LofGroupK2') ) {
  /**
   * LofGroupK2 Class  extends the LofSliderGroupBase Class
   */   
   class LofGroupK2 extends LofGroupBase{
    
    /**
     * @var string $__name 
     *
     * @access private;
     */
    var $__name = 'k2';
    
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
      if( !LofGroupK2::isK2Existed() ){
        return array();
      } 
      return $this->__getList( $params );
    }
    
    
    /**
     * check K2 Existed ?
     */
    public function isK2Existed(){
      return is_file( JPATH_SITE.DS.  "components" . DS . "com_k2" . DS . "k2.php" ); 
    }
    
    /**
     * get the list of k2 items
     * 
     * @param JParameter $params;
     * @return Array
     */
    public function __getList( $params ){
      $mainframe = &JFactory::getApplication();
      $maxTitle      = $params->get( 'max_title', '100' );
      $maxDesciption = $params->get( 'max_description', 100 ); 
      $openTarget    = $params->get( 'open_target', 'parent' );
      $formatter     = $params->get( 'style_displaying', 'title' );
      $titleMaxChars = $params->get( 'title_max_chars', '100' );
      $descriptionMaxChars = $params->get( 'description_max_chars', 100 );
      $condition     = $this->buildConditionQuery( $params );
      
      $ordering      = $params->get( 'k2_ordering', 'created_asc');
      $limit         = $params->get( 'limit_items',  5 );
      $ordering      = str_replace( '_', '  ', $ordering );
      $my          = &JFactory::getUser();
      $aid         = $my->get( 'aid', 0 );
      $thumbWidth    = (int)$params->get( 'thumbnail_width', 35 );
      $thumbHeight   = (int)$params->get( 'thumbnail_height', 60 );
      $imageHeight   = (int)$params->get( 'main_height', 300 ) ;
      $imageWidth    = (int)$params->get( 'main_width', 660 ) ;
      $isThumb       = $params->get( 'auto_renderthumb',1);
      $isStripedTags = $params->get( 'auto_strip_tags', 0 );
      $extraURL     = $params->get('open_target')!='modalbox'?'':'&tmpl=component'; 
      $db     = &JFactory::getDBO();
      $date   =& JFactory::getDate();
      $now    = $date->toMySQL();
      
      require_once ( JPath::clean(JPATH_SITE.'/components/com_k2/helpers/route.php') );
      $query = "SELECT a.*, cr.rating_sum/cr.rating_count as rating, c.name as categoryname,
              c.id as categoryid, c.alias as categoryalias, c.params as categoryparams, cc.commentcount as commentcount".
          " FROM #__k2_items as a".
            " LEFT JOIN #__k2_categories c ON c.id = a.catid" .
            " LEFT JOIN #__k2_rating as cr ON a.id = cr.itemid".
            " LEFT JOIN (select cm.itemid  as id, count(cm.id) as commentcount from #__k2_comments as cm
                                  where cm.published=1 group by cm.itemid) as cc on a.id = cc.id";
        
      $query .= " WHERE a.published = 1"
            . " AND a.access <= {$aid}"
            . " AND a.trash = 0"
            . " AND c.published = 1"
            . " AND c.access <= {$aid}"
            . " AND c.trash = 0 " ; 
      if( $params->get('featured_items_show','0') == 0 ){
        $query.= " AND a.featured != 1";
      } elseif(  $params->get('featured_items_show','0') == 2 ) {
        $query.= " AND a.featured = 1";
      }
      
      $query .=  $condition . ' ORDER BY ' . $ordering; 
      $query .=  $limit ? ' LIMIT ' . $limit : '';
  
      $db->setQuery($query);
      $data = $db->loadObjectlist();
  
      if( empty($data) ) return array();
    
      foreach( $data as $key => &$item ){ 
        if($item->access <= $aid ) {
          $item->link = JRoute::_(K2HelperRoute::getItemRoute($item->id.':'.$item->alias, $item->catid.':'.$item->categoryalias).$extraURL);
        } else {
          $item->link = JRoute::_('index.php?option=com_user&view=login');
        }
        $item->date = JHtml::_('date', $item->created, JText::_('DATE_FORMAT_LC2')); 
        
        $item->subtitle = self::substring( $item->title, $titleMaxChars );
        $item->description = self::substring( $item->introtext, $descriptionMaxChars,true);
               
       $item = self::parseImages( $item );
        if( $item->mainImage &&  $image=$this->renderThumb($item->mainImage, $imageWidth, $imageHeight, $item->title, $isThumb ) ){
          $item->mainImage = $image;
        }
        $item->rating = (is_numeric($item->rating))?floatval($item->rating / 5 * 100):null;
        if( $item->thumbnail &&  $image = $this->renderThumb($item->thumbnail, $thumbWidth, $thumbHeight, $item->title, $isThumb ) ){
          $item->thumbnail = $image;
        }                         
      }
      return $data; 
    }
    
    /**
     * build condition query base parameter  
     * 
     * @param JParameter $params;
     * @return string.
     */
    public  function buildConditionQuery( $params ){
      $source = trim($params->get( 'k2_source', 'k2_category' ) );
      if( $source == 'k2_category' ){
        $catids = $params->get( 'k2_category','');
        
        if( !$catids ){
          return '';
        }
        $catids = !is_array($catids) ? $catids : '"'.implode('","',$catids).'"';
        $condition = ' AND  a.catid IN( '.$catids.' )';
      } else {
        $ids = preg_split('/,/',$params->get( 'k2_items_ids',''));  
        $tmp = array();
        foreach( $ids as $id ){
          $tmp[] = (int) trim($id);
        }
        $condition = " AND a.id IN('". implode( "','", $tmp ) ."')";
      }
      return $condition;
    }
    
    /**
     * looking for image inside the media folder.
     */
    public  function lookingForK2Image( &$item, $size='XL' ){
      //Image
      $item->imageK2Image='';
      if (JFile::exists(JPATH_SITE.DS.'media'.DS.'k2'.DS.'items'.DS.'cache'.DS.md5("Image".$item->id).'_'.$size.'.jpg'))
        $item->imageK2Image = JURI::root().'media/k2/items/cache/'.md5("Image".$item->id).'_'.$size.'.jpg';
      return $item; 
    }

    /**
     * parser a image in the content of article.
     *
     * @param poiter $row .
     * @return void
     */
    public  function parseImages( $row ){
      $text =  $row->introtext.$row->fulltext;
      $data = $this->parserCustomTag( $text );
      if( isset($data[1][0]) ){
        $tmp = $this->parseParams( $data[1][0] );
        $row->mainImage = isset($tmp['src']) ? $tmp['src']:'';
        $row->thumbnail = $row->mainImage ;// isset($tmp['thumb']) ?$tmp['thumb']:''; 
      } else {
        $row  = LofGroupK2::lookingForK2Image( $row );
        
        if( $row->imageK2Image != '' ){
          $row->thumbnail = $row->mainImage = $row->imageK2Image; 
          return $row;
        } 
        preg_match ( self::$regex, $text, $matches); 
        $images = (count($matches)) ? $matches : array();
        if (count($images)){
          $row->mainImage = $images[1];
          $row->thumbnail = $images[1];
        } else {
          $row->thumbnail = '';
          $row->mainImage = ''; 
        }
      }
      return $row;
    }
  }
}
?>
