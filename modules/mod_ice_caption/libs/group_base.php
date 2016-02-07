<?php
 // No direct access
defined('_JEXEC') or die('Restricted access');
/**
 * $DESC
 * 
 * @version		$Id: helper.php $Revision
 * @package		modules/$moduleName
 * @subpackage	libs.
 * @copyright	Copyright(C) April 2010, LandOfExtensions.Com <@emai:landofcoder@gmail.com, tyrantit@gmail.com>.All rights reserved.
 * @license		GNU General Public License version 2
 */
if(!class_exists('IceGroupBase'))
{ 
	class IceGroupBase
	{
		/**
		 * @var string $_name is name of group;
		 *
		 * @access private;
		 */
		var $__name = 'base';
		/**
		 * @var string $__currentPath;
		 *
		 * @access private;
		 */
		var $__currentPath = '';
		/**
		 * getter of current path variable
		 */
		function setCurrentPath($path){
			$this->__currentPath = $path;
		}
		/**
		 * getter of current path variable
		 */
		function getCurrentPath(){
			return $this->__currentPath;
		}
		/**
		 * getter of name variable
		 */
		function getName(){
			return $this->__name;	
		}
		/**
		 * render paramters form
		 *
		 * @return string
		 */
		function renderForm($params=array(), $fileName='form')
		{
			// look up configuration file which build-in this plugin or the tempate used.
			$path = $this->getCurrentPath().$fileName.'.xml';
	
			if(file_exists($path))
			{
				$params = new JParameter( $params, $path);
				$content = $params->render('params') ;								
				return $content;
			}
			return ;
		}
		/**
		 * parser a image in the content of article.
		 *
		 * @param.
		 * @return
		 */
		 function parseImages(&$row)
		 {
			$text =  $row->introtext.$row->fulltext;
			$data = self::parserCustomTag($text);
			
			if(isset($data[1][0]))
			{
				$tmp = self::parseParams($data[1][0]);
				$row->mainImage = isset($tmp['src']) ? $tmp['src']:'';
				$row->thumbnail = $row->mainImage ;// isset($tmp['thumb']) ?$tmp['thumb']:'';	
			}
			else
			{
				$regex = "/\<img.+src\s*=\s*\"([^\"]*)\"[^\>]*\>/";
				preg_match($regex, $text, $matches); 
				$images =(count($matches)) ? $matches : array();
				
				if(count($images))
				{
					$row->mainImage = $images[1];
					$row->thumbnail = $images[1];
				}
				else
				{
					$row->thumbnail = '';
					$row->mainImage = '';	
				}
			}
		}
		/**
		 * This function extracts the non-tags string and returns a correctly formatted string
		 * It can handle all html entities e.g. &amp;, &quot;, etc..
		 *
		 * @param string $s
		 * @param integer $srt
		 * @param integer $len
		 * @param bool/integer	Strict if this is defined, then the last word will be complete. If this is set to 2 then the last sentence will be completed.
		 * @param string A string to suffix the value, only if it has been chopped.
		 */
		function html_substr($s, $srt, $len = NULL, $strict=false, $suffix = "...",$isStripedTags = false)
		{
			if($isStripedTags)
			{
				self::substring($s, $len, $isStripedTags, $suffix);
			}
			if(is_null($len)){ $len = strlen($s);}
			$f = 'static $strlen=0;
					if($strlen >= ' . $len . ') { return "><"; } 
					$html_str = html_entity_decode($a[1]);
					$subsrt   = max(0,('.$srt.'-$strlen));
					$sublen = ' .(empty($strict)? '(' . $len . '-$strlen)' : 'max(@strpos($html_str, "' .($strict===2?'.':' ') . '",(' . $len . ' - $strlen + $subsrt - 1)), ' . $len . ' - $strlen)') . ';
					$new_str = substr($html_str, $subsrt,$sublen); 
					$strlen += $new_str_len = strlen($new_str);
					$suffix = ' .(!empty($suffix) ? '($new_str_len===$sublen?"'.$suffix.'":"")' : '""') . ';
					return ">" . htmlentities($new_str, ENT_QUOTES, "UTF-8") . "$suffix<";';
			
			return preg_replace(array("#<[^/][^>]+>(?R)*</[^>]+>#", "#(<(b|h)r\s?/?>){2,}$#is"), "", trim(rtrim(ltrim(preg_replace_callback("#>([^<]+)<#", create_function(
					'$a',
				  $f
				), ">$s<"), ">"), "<")));
		}


		public function substring($text, $length = 100, $isStripedTags=true,  $replacer='...')
		{
			$string = $isStripedTags? strip_tags($text):$text;
			return JString::strlen($string) > $length ? JString::substr($string, 0, $length).$replacer: $string;
		}
		/**
		 * parser a custom tag in the content of article to get the image setting.
		 * 
		 * @param string $text
		 * @return array if maching.
		 */
		 function parserCustomTag($text)
		 { 
			if(preg_match("#{lofimg(.*)}#s", $text, $matches, PREG_OFFSET_CAPTURE)){ 
				return $matches;
			}	
			return null;
		}
		/**
		 *  check the folder is existed, if not make a directory and set permission is 755
		 *
		 * @param array $path
		 * @access public,
		 * @return boolean.
		 */
		 function renderThumb($path, $width=100, $height=100, $title='', $isThumb=true, $image_quanlity = 100)
		 {
			if(!preg_match("/.jpg|.png|.gif/",strtolower($path))) return '&nbsp;';
			if($isThumb)
			{
				if(empty($image_quanlity)){
					$image_quanlity = 100;
				}
				$path = str_replace(JURI::base(), '', $path);
				$imagSource = JPATH_SITE.DS. str_replace('/', DS,  $path);
				
				if(file_exists($imagSource))
				{
					$path =  $width."x".$height.'/'.$image_quanlity.'/'.$path;
					$thumbPath = JPATH_SITE.DS.'images'.DS.'icethumbs'.DS. str_replace('/', DS,  $path);
					if(!file_exists($thumbPath)) {
						$thumb = PhpThumbFactory::create($imagSource);
						if(!empty($image_quanlity)){
							$thumb->setOptions( array('jpegQuality'=> $image_quanlity) );
						}
						if(!self::makeDir($path)) {
								return '';
						}
						$thumb->adaptiveResize($width, $height);
						 
						$thumb->save($thumbPath); 
					}
					$path = JURI::base().'images/icethumbs/'.$path;
				} 
			}
			return '<img src="'.$path.'" title="'.$title.'" alt="'.$title.'" />';
		}
		/**
		 *  check the folder is existed, if not make a directory and set permission is 755
		 *
		 * @param array $path
		 * @access public,
		 * @return boolean.
		 */
		 function makeDir($path)
		 {
			$folders = explode('/', ($path));
			$tmppath =  JPATH_SITE.DS.'images'.DS.'icethumbs'.DS;
			if(!file_exists($tmppath))
			{
				JFolder::create($tmppath, 0755);
			} 
			
			for($i = 0; $i < count($folders) - 1; $i ++)
			{
				if(! file_exists($tmppath . $folders [$i]) && ! JFolder::create($tmppath . $folders [$i], 0755))
				{
					return false;
				}	
				$tmppath = $tmppath . $folders [$i] . DS;
			}		
			return true;
		}
		/**
		 * Abstract function get a item by id
		 */
		function getItemById($itemId){ return array();}
		/**
		 * Abstract function : get list item by name of group
		 */
		function getListByGroup($name, $published=true){ return array(); }
		/**
		 * Abstract function get list item by category id
		 */
		function getListByCategoryId($groupId, $published=true){ return array(); }
		/**
		 *  Abstract function get list item by parameter
		 */
		function getListByParameters($params){ return array(); }
	}
}