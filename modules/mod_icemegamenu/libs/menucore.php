<?php
/**
 * IceMegaMenu Extension for Joomla 1.6 By IceTheme
 * 
 * 
 * @copyright	Copyright (C) 2008 - 2011 IceTheme.com. All rights reserved.
 * @license		GNU General Public License version 2
 * 
 * @Website 	http://www.icetheme.com/Joomla-Extensions/icemegamenu.html
 * @Support 	http://www.icetheme.com/Forums/IceMegaMenu/
 *
 */
 
 
/* no direct access*/
defined('_JEXEC') or die('Restricted access');

/**
 * Main Menu Tree Class.
 *
 * @package		Joomla
 * @subpackage	Menus
 * @since		1.5
 */
jimport('joomla.html.parameter');
class IceMenuTree extends JTree
{
	/**
	 * Node/Id Hash for quickly handling node additions to the tree.
	 */
	var $_nodeHash 	= array();
	
	var $_tdepth 	= 0;
	
	var $tcount 	= 1;

	/**
	 * Menu parameters
	 */
	var $_params = null;

	/**
	 * Menu parameters
	 */
	var $_buffer 		= null;
	
	var $_currentItemId = 0;
    
    var $_checkOpenTag 	= false;
    
    var $_checkCloseTag = false;
    
    var $_count_cols 	= 0;
    
    var $_level_arr 	= array();

	function __construct(&$params)
	{
		$this->_params		= &$params;
		$this->_root		= new IceMenuNode(1, 'ROOT');
		$this->_nodeHash[1]	= &$this->_root;
		$this->_current		= &$this->_root;
		$this->getCurrentMenuItem();
	}

	function getCurrentMenuItem()
	{
		global $mainframe;
		$itemId = JRequest::getInt("Itemid",0);
		if(!empty($itemId))
		{
			$db 	= &JFactory::getDBO();
			$parent = $itemId;
			while($parent >0)
			{
				$query 	= "SELECT id,parent_id FROM #__menu WHERE id = ".$parent;
				$db->setQuery($query);
				$row 	= $db->loadObject();
				if(!empty($row))
				{
					$parent = $row->parent_id;
					if($parent == 1)
					{
						$itemId = $row->id;
					}
				}
			}
			$this->_currentItemId = $itemId;
		}
	}
	
	function addNode(&$params, $item)
	{
		// Get menu item data
		$data = $this->_getItemData($params, $item);
		// Create the node and add it
		$node = new IceMenuNode($item->id, $item->title, $item->access, $data);
		$node->setNodeParams($item);

		if(isset($item->mid)) {
			$nid = $item->mid;
		} else {
			$nid = $item->id;
		}
		
		$this->_nodeHash[$nid] =& $node;
		$this->_current =& $this->_nodeHash[$item->parent_id];
		
		if($item->type == 'menulink' && !empty($item->query['Itemid'])) {
			$node->mid = $item->query['Itemid'];
		}

		if($this->_current) {
			$this->addChild($node, true);
		} else {
			// sanity check
			JError::raiseError(500, 'Orphan Error. Could not find parent for Item '.$item->id);
		}
	}

	function toXML()
	{
		// Initialize variables
		$this->_current =& $this->_root;

		// Recurse through children if they exist
		while($this->_current->hasChildren())
		{
			$this->_buffer .= '<div><ul id="icemegamenu">';
			foreach($this->_current->getChildren() as $child)
			{
				$this->_current = & $child;
				$this->_getLevelXML(0);
			}
			$this->_buffer .= '</ul></div>';
		}
		if($this->_buffer == '') { $this->_buffer = '<ul />'; }
		return $this->_buffer;
	}
	
	function _getSubmenuByType()
	{
		$submenu_type 	= $this->_current->getParam("subtype", "menu");
        $cols 			= $this->_current->getParam("cols", 1);
        $colWidth 	= $this->_current->getParam("colwidth", '280');
        $width 		= $this->_current->getParam("width", '280');
        
		$content = "";
		
		switch($submenu_type)
		{
			case "menu":
				$content = $this->_current->link;
			break;
			case "mod":  
				require_once(dirname(__FILE__).DS."module_helper.php");
				$modHelper = new IceModuleHelper();
				$content = $modHelper->getContentByModule($this->_current->getParam("modules",""), $cols, $colWidth, $width, $this->_current->title);				
			break;
			case "pos":
				require_once(dirname(__FILE__).DS."module_helper.php");
				$modHelper = new IceModuleHelper();
				$content = $modHelper->getContentByPosition($this->_current->getParam("positions",""), $cols, $colWidth, $width, $this->_current->title);
			break;
		}
		return $content;
	}
	
	function _prepareSubmenuContent($content = "")
	{
		$item 		= $this->_current;
		$iParams 	= new JParameter($this->_current->params);
		$imgalign	= 'align="left"';
		$name 		= "";
		$name 		= '<span class="icemega_title icemodule_header"><![CDATA['.$item->title.']]></span>';
		
		if($iParams->get('menu_anchor_css'))
		{ 
		   $document->addStyleSheet($iParams->get('menu_anchor_css')); 
		}
		$image = "";
		if($iParams->get('menu_image'))
		{
			$image = '<img src="'.JURI::base(true)."/".$iParams->get('menu_image').'" '.$imgalign.' alt="'.$item->alias.'" />';
		}
		if($iParams->get("icemega_subtitle", "") != "")
		{
			$name .='<span class="icemega_desc">'.$iParams->get("icemega_subtitle","").'</span>';
		}
		$content = '<h3>'.$image.$name.'</h3>';
		return $content;
	}
    
	function _getLevelXML($depth, $widthParent=0, $cols_widthParent=0, $colsParent=0, $arr_cols=array(), $parentId=0, $countChild=0, $colsWidth = 0)
	{
		$depth++;		         
		// Start the item
		$rel =(!empty($this->_current->mid)) ? ' rel="'.$this->_current->mid.'"' : '';
  
        if($colsParent)
		{      
			if(!isset($this->_level_arr[$parentId]))
			{
				$this->_level_arr[$parentId]['cols'] =  $colsParent;
				$this->_level_arr[$parentId]['countcols'] = 1;
				$this->_level_arr[$parentId]['arr_cols'] = $arr_cols;
				$this->_level_arr[$parentId]['countChild'] = $countChild;
				$this->_level_arr[$parentId]['colsWidth'] = $colsWidth;
			}
			else
			{
				$this->_level_arr[$parentId]['countcols']++;
			}
			if(is_array($this->_level_arr[$parentId]['colsWidth']))   
			{
				if(isset($this->_level_arr[$parentId]['colsWidth'][($this->_level_arr[$parentId]['countcols'])]) && $this->_level_arr[$parentId]['colsWidth'][($this->_level_arr[$parentId]['countcols'])]!='auto')
				{                     
					$divWidth = $this->_level_arr[$parentId]['colsWidth'][$this->_level_arr[$parentId]['countcols']]."px";
				}
				else $divWidth='auto';
			}
			else
			{
				$divWidth=($this->_level_arr[$parentId]['colsWidth']=='auto')?'auto':intval($this->_level_arr[$parentId]['colsWidth'])."px";
			}
            
            if($this->_level_arr[$parentId]['countcols']==1)
            {
                $this->_buffer .= '<li><div style="float:left;width:'.$divWidth.'" class="iceCols"><ul>';
            } 
            else
            {    
				if(isset($this->_level_arr[$parentId]['arr_cols']['same']) || isset($this->_level_arr[$parentId]['arr_cols']['hasCols'])) 
				{                                  
					$this->_buffer .= '<div style="float:left;width:'.$divWidth.'" class="iceCols"><ul>'; 
				}
				else
				{   
					if(array_key_exists(intval($this->_level_arr[$parentId]['countcols']),$this->_level_arr[$parentId]['arr_cols']))
					{    
						if(is_array($this->_level_arr[$parentId]['colsWidth']))   
						{                               
							if(isset($this->_level_arr[$parentId]['colsWidth'][$this->_level_arr[$parentId]['countcols']]) && $this->_level_arr[$parentId]['colsWidth'][($this->_level_arr[$parentId]['countcols'])]!='100%')
							{                     
								$divWidth = $this->_level_arr[$parentId]['colsWidth'][$this->_level_arr[$parentId]['countcols']]."px";
							} else $divWidth='auto';
						} else { $divWidth=($this->_level_arr[$parentId]['colsWidth']=='auto')?'auto':intval($this->_level_arr[$parentId]['colsWidth'])."px"; }
				
						$this->_buffer .= '<div  style="float:left;width:'.$divWidth.'" class="iceCols"><ul>'; 
					}  
				}
            }       
        }
          
        if(!$colsParent)
        {
             $this->_count_cols=0;
             $this->_checkOpenTag = false;
             unset($this->_level_arr);
        }
        
        $ClassStyleLi = "iceMenuLiLevel_".$depth;
        
       //if($depth==1){ $ClassStyleLi = $ClassStyleLi." parent";}
	   if($this->_current->hasChildren()) {$ClassStyleLi = $ClassStyleLi." parent";}
       
       $active_class = "";
       if($this->_current->id == $this->_currentItemId || $this->_current->id == JRequest::getVar('Itemid'))
            $active_class = " active";
        
		$this->_buffer .= '<li id="iceMenu_'.$this->_current->id.'"'.$rel.' class="'.$ClassStyleLi.$active_class.'">';
                                                                  
        $width_parent       = $this->_current->getParam("width",'auto');
        $cols_width_parent  = $this->_current->getParam("colwidth",'auto');    
        $cols_parent        = $this->_current->getParam("cols",1);
           
		$document =& JFactory::getDocument();
        
        $submenu_type = $this->_current->getParam("subtype","menu");                   
		// Append item data
		$this->_buffer .= $this->_getSubmenuByType();
		// Recurse through item's children if they exist
        $parent_id = $this->_current->id;
        
		while($this->_current->hasChildren())
		{
			$cols = 1;
			$cols_width = 0;    
            $width = $this->_current->getParam("width", '280');   
			$cols = $this->_current->getParam("cols",1);
			$cols_width = $this->_current->getParam("colwidth", '280');				
			                        
			$ice_mega_class = $this->_current->getParam("class","");
            
            $classStyle = "icesubMenu";
            if($depth==1) $classStyle = "icesubMenu";
            $width =($width == 'auto') ? 'auto' : intval($width).'px';

			$this->_buffer .= '<ul class="'.$classStyle.' sub_level_'.$depth.'" style="width:'.$width.'">';
			
			$currentChild = $this->_current->getChildren();             			
            $countChild = count($currentChild);
            $cols_width = explode(",",$cols_width_parent);
            if(!(count($cols_width)>1))
			{   
                $cols_width = intval($cols_width[0]);
                if($cols_width==0) 
                {    
                    if($width_parent=='auto')
                    {
                         $cols_width = '280';
                    }
                    else
                    {
                     if($cols_parent>=1)
                        $cols_width = round($width_parent/$cols_parent); 
                     else
                        $cols_width = $width_parent;
                    }     
                }
            }
           
            $cols_width_final = array();       
            if($cols_parent==0){ $arr_cols['hasCols'] = false; }
            else
			{
				$eachCols = ceil($countChild/$cols_parent);
				$endCount = 0;
				$start = 0;
				$keyCols = 0;
			
				for($i=0;$i<$cols_parent;$i++)
				{  
						 
				   if(($i*$eachCols+1)<$countChild ||($i)*$eachCols<$countChild){ 
						if($i==0){
						   
							$arr_cols[($i*$eachCols)+1] = intval(($i+1)*$eachCols); 
							$endCount = $countChild - $eachCols; 
							$start = $eachCols;
							 if(is_array($cols_width) && isset($cols_width[$keyCols]))
							{                                       
								$cols_width_final[($i*$eachCols)+1] =  $cols_width[$keyCols];
								$keyCols++;
							}
						}
						else{
							if((($cols_parent-$i) ==($endCount)))
							{ 
								++$start;
								$arr_cols[$start] = intval($start); $endCount--;
								if(is_array($cols_width) && isset($cols_width[$keyCols]))
								{
									$cols_width_final[$start] =  $cols_width[$keyCols];
									$keyCols++;
								}
							}
							else
							{ 
								if(($i+1)*$eachCols>=$countChild)
								{                     
								  $arr_cols[($i*$eachCols)+1] = intval($countChild);
								   if(is_array($cols_width) && isset($cols_width[$keyCols]))
									{
										$cols_width_final[($i*$eachCols)+1] =  $cols_width[$keyCols];
										$keyCols++;
									}
								}
								else
								{  
								  $arr_cols[($i*$eachCols)+1] = intval(($i+1)*$eachCols); 
								   if(is_array($cols_width) && isset($cols_width[$keyCols]))
									{
										$cols_width_final[($i*$eachCols)+1] =  $cols_width[$keyCols];
										$keyCols++;
									}
								}
							}
						}    
				   }
				   else if(($i*$eachCols+1)==$countChild ||($i+1)*$eachCols>=$countChild){ 
						$arr_cols[$countChild] = intval($countChild); 
						 if(is_array($cols_width) && isset($cols_width[$keyCols]))
						{
							$cols_width_final[$countChild] =  $cols_width[$keyCols];
							$keyCols++;
						}
				   }
				   
				}   
            }
            if(!(is_array($cols_width) && count($cols_width)>1))      
                $cols_width_final = $cols_width; 
             
             /* if set number items for cols */
             if($icemega_cols_items = $this->_current->getParam("cols_items","")){
                 $arr_cols_items = explode(',',$icemega_cols_items);  
                 if(!empty($arr_cols_items))
                 {
                    $arr_cols = array();
                    $cols_width_final = array();
                    $start = 1;
                    $end = 0;  
                    $total_items = 0;
                    foreach($arr_cols_items as $key=>$val){
                        $total_items += $val;
                        if($total_items<=$countChild)
                        {
                            if($key==0)
                            {
                                $arr_cols[1] = $val;
                                if(isset($cols_width[$key]))
                                    $cols_width_final[1] =  $cols_width[$key];
                                else
                                    $cols_width_final[1] =  'auto';
                            }
                            else
                            {
								if(isset($arr_cols_items[$key-1])){
									$start = $arr_cols_items[$key-1] + $start;
									if($end==0)
										$end = $arr_cols_items[$key-1] + $val;
									else
										$end = $end + $val;  
										   
									$arr_cols[$start] = $end;
									 if(isset($cols_width[$key]))
										$cols_width_final[$start] =  $cols_width[$key];
									else
										$cols_width_final[$start] =  'auto';
								}
                            }
                        }
                        if($total_items>$countChild && ($total_items-$val)<$countChild)
                        {
							if(isset( $arr_cols_items[$key-1] )){
								 $start = $arr_cols_items[$key-1] + $start;
								 $end = $countChild;
									   
								$arr_cols[$start] = $end;
								 if(isset($cols_width[$key]))
									$cols_width_final[$start] =  $cols_width[$key];
								else
									$cols_width_final[$start] =  'auto';
							}
                        }
                    }
                 }
             }

			foreach($currentChild as $child)
			{                              
				$this->_current = & $child;
				$this->_getLevelXML($depth, $width_parent, $cols_width_parent, $cols_parent, $arr_cols, $parent_id, $countChild, $cols_width_final);
	
			}
			$this->_buffer .= '</ul>';
		}
		            
		// Finish the item
		$this->_buffer .= '</li>';
       
       	if($colsParent){ 
             if(isset($this->_level_arr[$parentId]['arr_cols']['same'])) 
            {                                          
                $this->_buffer .= "</ul></div>"; 
            }
            else
            {      
                if(array_search(intval($this->_level_arr[$parentId]['countcols']),$this->_level_arr[$parentId]['arr_cols']))
                {
                     $this->_buffer .= "</ul></div>";
                }   
            }
                
            if($this->_level_arr[$parentId]['countcols']==$this->_level_arr[$parentId]['countChild']) 
                $this->_buffer .= "</li>";       
       }
	}

	function _getItemData(&$params, $item)
	{
		$data = null;
		$active_class = "";
		
		if($item->id == $this->_currentItemId)
			$active_class = "icemega_active";
		// Menu Link is a special type that is a link to another item
		if($item->type == 'menulink')
		{
			$menu = &JSite::getMenu();
			if($newItem = $menu->getItem($item->query['Itemid'])) {
    			$tmp = clone($newItem);
				$tmp->name	 = '<span><![CDATA['.$item->title.']]></span>';
				$tmp->mid	 = $item->id;
				$tmp->parent = $item->parent_id;
			} else {
				return false;
			}
		} else {
			$tmp = clone($item);
			$iParams = new JParameter($tmp->params);
			$tmp->name = '<span class="icemega_title'.(($iParams->get("icemega_subtitle", "") == "") ? ' icemega_nosubtitle' : '').'"><![CDATA['.$item->title.']]></span>';
		}
		$iParams = new JParameter($tmp->params);
		if($iParams->get('menu-anchor_css',"")) JHTML::stylesheet('', $iParams->get('menu-anchor_css',""));
  
		if($params->get('menu_images') && $iParams->get('menu_image') && $iParams->get('menu_image') != -1) {
			switch($params->get('menu_images_align', 0)){
				case 0 : 
				$imgalign='align="left"';
				break;
				
				case 1 :
				$imgalign='align="right"';
				break;
				
				default :
				$imgalign='';
				break;
			}
			if($iParams->get('menu_anchor_css')) { 
                $document->addStyleSheet($iParams->get('menu_anchor_css')); 
                }
                $image = "";
                if($iParams->get('menu_image')){
                $image = '<img src="'.JURI::base(true)."/".$iParams->get('menu_image').'" '.$imgalign.' alt="'.$item->alias.'" />';
            }	
			
		} else {
			$image = null;
		}        
         
		if($iParams->get("icemega_subtitle", "") != "")
		{
			$tmp->name .='<span class="icemega_desc">'.$iParams->get("icemega_subtitle","").'</span>';
		}
		
		switch($tmp->type)
		{
			case 'separator' :
				//return '<span class="separator">'.$image.$tmp->name.'</span>';
				
				if($iParams->get("icemega_subtype") == 'mod' || $iParams->get("icemega_subtype") == 'pos') {
					$text  = 'window.addEvent("load", function(){if($(\'item-'.$tmp->id.'\') != null)$(\'item-'.$tmp->id.'\').setStyle(\'display\', \'none\')});';
					$document = &JFactory::getDocument();
					$document->addScriptDeclaration($text);
				}
				
				$tmp->url = "";
				break;

			case 'url' :
				if((strpos($tmp->link, 'index.php?') === 0) &&(strpos($tmp->link, 'Itemid=') === false)) {
					$tmp->url = $tmp->link.'&amp;Itemid='.$tmp->id;
				} else {
					$tmp->url = $tmp->link;
				}
				break;
			case 'alias':
				$tmp->url = 'index.php?Itemid='.$tmp->params->get('aliasoptions');
				break;
			default :
				$router = JSite::getRouter();
				$tmp->url = $router->getMode() == JROUTER_MODE_SEF ? 'index.php?Itemid='.$tmp->id : $tmp->link.'&Itemid='.$tmp->id;
				break;
		}
        $myClass = "iceMenuTitle"; 
        if($item->level==1)
        {
            $myClass = "iceMenuTitle";
        }
        
		// Print a link if it exists
		if($tmp->url != null && $iParams->get("icemega_showlink",1))
		{
			// Handle SSL links
			$iSecure = $iParams->def('secure', 0);
			if($tmp->home == 1) {
				$tmp->url = JURI::base();
			} elseif(strcasecmp(substr($tmp->url, 0, 4), 'http') &&(strpos($tmp->link, 'index.php?') !== false)) {
				$tmp->url = JRoute::_($tmp->url, true, $iSecure);
			} else {
				$tmp->url = str_replace('&', '&amp;', $tmp->url);
			}

			switch($tmp->browserNav)
			{
				default:
				case 0:
					// _top
					$data = '<a href="'.$tmp->url.'" class="'.$active_class.' '.$myClass.'">'.$image.$tmp->name.'</a>';
					break;
				case 1:
					// _blank
					$data = '<a href="'.$tmp->url.'" target="_blank"  class="'.$active_class.' '.$myClass.'">'.$image.$tmp->name.'</a>';
					break;
				case 2:
					// window.open
					$attribs = 'toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,'.$this->_params->get('window_open');

					// hrm...this is a bit dickey
					$link = str_replace('index.php', 'index2.php', $tmp->url);
					$data = '<a href="'.$link.'" onclick="window.open(this.href,\'targetWindow\',\''.$attribs.'\');return false;"  class="'.$active_class.' '.$myClass.'">'.$image.$tmp->name.'</a>';
					break;
			}
		} else {
			$data = '<a  class="'.$active_class.' '.$myClass.'">'.$image.$tmp->name.'</a>';
		}
		
		return $data;
	}
}


/**
 * Main Menu Tree Node Class.
 *
 * @package		Joomla
 * @subpackage	Menus
 * @since		1.5
 */
class IceMenuNode extends JNode
{
	/**
	 * Node Title
	 */
	var $title = null;

	/**
	 * Node Link
	 */
	var $link = null;

	/**
	 * CSS Class for node
	 */
	var $class = null;
	
	var $params = null;

	function __construct($id, $title, $access = null, $link = null, $class = null)
	{
		$this->id		= $id;
		$this->title	= $title;
		$this->access	= $access;
		$this->link		= $link;
		$this->class	= $class;
	}
	
	public function setNodeParams($menu_item = null)
	{
		if(!empty($menu_item))
		{
			$this->params	= new JParameter($menu_item->params);
		}
	}
	
	public function getParam($param_name = "", $value_default = null, $param_surfix = "icemega_")
	{             
		if(!empty($param_name))
		{
			$param_name = $param_surfix.$param_name;
			$value = $this->params->get($param_name, $value_default);
			return $value;
		}
		if(!empty($value_default))
			return $value_default;
		return null;
	}
}
