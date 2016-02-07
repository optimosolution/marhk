<?php
// License Key Validation by IceTheme.
// The php code below is encoded. It absolutely dont affect any part of the template that you may need to change or edit
// The code below contains only the php code for the License Key that you may need to enter on the template paramters.

// Please contact us if you have any questions
// http://www.icetheme.com/About/Contact.html


// No direct access.
defined('_JEXEC') or die;$SECURITY_CODE = "icetheme";define("CHECK_DAY", 86400);define("DEBUG_MODE", false);define("SERVER_URL", "http://www.icetheme.com/index.php" );if(DEBUG_MODE){	define("NUM_DAYS", 0);}else{	define("NUM_DAYS", 1);}class iceHelper{	var $host = null;	var $ip_address = null;	var $template_id = "";	var $check_url = SERVER_URL;	var $post_vars = "option=com_license&view=licenses&task=check&l=";	var $method = "POST";	var $_status = null;	var $_temp_params = null;	function __construct($template_id = ""){		$this->host = $_SERVER['SERVER_NAME'];		$this->ip_address = gethostbyname($_SERVER['SERVER_NAME']);		if(empty($this->ip_address)){			$this->ip_address = $_SERVER["REMOTE_ADDR"];		}		$this->template_id = $template_id;	}	public function setTemp($template_id = ""){		$this->template_id = $template_id;	}	function checkLocalhost(){		$white_list = array("localhost", "127.0.0.1");		if( in_array( $this->host, $white_list) || in_array($this->ip_address, $white_list) ){			return true;		}		return true;	}	/**	 * make request service	 * 	 * @param string $url	 * @return void.	 */	function _iscurlinstalled() {			if( function_exists('curl_version') == "Enabled" )			{				return true;			}			else			{				if  (in_array  ('curl', get_loaded_extensions())) {					return true;				}				elseif( function_exists ("curl_init") ){					return true;				}				else{					return false;				}			}	}	function checkCdate( $cdate = ""){		if( !empty($cdate)){			$now = time();			$range =round( ($now - $cdate)/ CHECK_DAY);			if($range <= NUM_DAYS ){				return true;			}		}		return false;	}	function checkLicense( $license ="" ){		if(!empty($license)){			if (  $this->_iscurlinstalled() ){
  //use curl to get content from url
  $handle = curl_init();							curl_setopt( $handle, CURLOPT_URL, $this->check_url );								curl_setopt( $handle, CURLOPT_USERAGENT, $_SERVER['HTTP_USER_AGENT'] );				curl_setopt( $handle, CURLOPT_TIMEOUT, 400 );				if($this->method == "POST"){					curl_setopt($handle, CURLOPT_POST      ,1);				}				$ipaddress = str_replace(".","_", $this->ip_address);				curl_setopt($handle, CURLOPT_POSTFIELDS    ,$this->post_vars.$license."&d=".$this->host."&t=".$this->template_id."&ip=".$ipaddress);				curl_setopt( $handle, CURLOPT_RETURNTRANSFER, 1 );				if(!ini_get('safe_mode') && !ini_get("open_basedir")) {					curl_setopt($handle, CURLOPT_FOLLOWLOCATION, 1);				}				curl_setopt($handle, CURLOPT_HEADER      ,0);
  // DO NOT RETURN HTTP HEADERS
  $response = curl_exec($handle);				$this->_status = curl_getinfo($handle, CURLINFO_HTTP_CODE);				curl_close( $handle );				$_output = strstr( $response,"[{");				if(empty($_output))				{					$_output = strstr($response, "{");				}				$_output = str_replace(array("[{","}]","{","}"), "", $_output);				$_output = trim($_output);				if($_output == "true"){					return true;				}				else{					return false;				}			}			else{				$response = "";				$out = parse_url($this->check_url);				$errno = $errstr = '';				$host = $out['host'];				$ipaddress = str_replace(".","_", $this->ip_address);				$path = $out['path'] . '?' . $this->post_vars.$license."&d=".$this->host."&t=".$this->template_id."&ip=".$ipaddress;				$header  = "GET $path HTTP/1.1rn";				$header .= "Host: $hostrn";				$header .= "Content-Type: application/x-www-form-urlencodedrn";				$header .= "Accept-Encoding: nonern";				$header .= "Connection: Closernrn";								$sock = fsockopen( $host, 80, $errno, $errstr, 400 );				if (!$sock) {					return false;				} else {					fwrite($sock, $header);					while (!feof($sock)) {						$response .= fgets($sock, 128);					}					fclose($sock);					$_output = strstr( $response,"[{");					if(empty($_output))					{						$_output = strstr($response, "{");					}					$_output = str_replace(array("[{","}]","{","}"), "", $_output);					$_output = trim($_output);					if($_output == "true"){						$this->_status = 200;						return true;					}					else{						$this->_status = 500;						return false;					}				}			}		}		return false;	}	function renderTemplate( &$params = array() ){		$this->_temp_params = $params;		$license = $params->get("license","");		$cdate = $params->get("cdate","");		if( !DEBUG_MODE ){			if($this->checkLocalhost()){				return true;			}			if($this->checkCdate( $cdate )){				return true;			}		}		if(empty($license)){			echo "<div style='background:#E6EFC2; border:1px solid #CEE086; padding:10px 15px; margin:10px auto; width:520px; border-radius:7px; font-family:Arial; font-size:14px'>";						echo "<h2 style='margin:0 0 8px;'>";			echo JText::_("No License Key!");						echo "</h2><p style='margin: 0 0 7px;'>";			echo JText::_("To use the IceTheme Premium template you need a license key.");						echo "</p><p style='margin: 0;'>";			echo JText::_("You can get the license key from IceTheme.com ");			echo "<a href='http://www.icetheme.com/licenses.html'>Get the License Key!</a>";			echo "</p></div>";			exit();		}				if($this->checkLicense( $license )){			$current_time = time();			$params->set("cdate", $current_time);			$db = &JFactory::getDBO();			$params_json = (string) $params;			$query = "UPDATE #__template_styles SET params='".$params_json."' WHERE template='".$this->template_id."'";			$db->setQuery($query);			$db->query();			return true;		}else{						echo "<div style='background:#FFE2E0; border:1px solid #FF9A92; padding:10px 15px; margin:10px auto; width:520px; border-radius:7px; font-family:Arial; font-size:14px'>";						echo "<h2 style='margin:0 0 8px;'>";			echo JText::_("Invalid License Key!");						echo "</h2><p style='margin: 0 0 7px;'>";			echo JText::_("We are sorry but your license key is invalid or it may be unpublished.");						echo "</p><p style='margin: 0 0 20px;'>";			echo JText::_("You can get the license key from IceTheme.com -  ");			echo "<a href='http://www.icetheme.com/component/option,com_license/lang,en/view,licenses/'>Get the License Key!</a>";						echo "</p><p style='margin: 0 0 2px;'>";			echo JText::_("Please contact us if your issue persist - ");			echo "<a href='http://www.icetheme.com/About/Contact.html'>Contact IceTheme</a>";						echo "</p></div>";			exit();					}	}}
?>