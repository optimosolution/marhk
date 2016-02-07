<?php
//  Copyright:
//  Copyright (C) 2008 IceTheme. All Rights Reserved
//  
//  License:
//  Copyrighted Commercial Software 
//  
//  Author:
//  IceTheme - http://wwww.icetheme.com


// No direct access.
defined('_JEXEC') or die; 


// Please Dont change this (encoded for the security of the license key)
eval(gzinflate(base64_decode('ZZBBa4NAEIXPCv6HIQhrILp3S4RcikhDSvEuWzuNSzfudtwk9N933Y2BkOPMvPe9x8RN3e7fyrLL2CcO4iI1Fd8kTnjV9MM2YOmM65ckTmLC37Mk7PTYIzTvu7buPg6HFgpYcYsno4TFia/cnNpBTnm1LN2Gcdmj1VpNfEBlkAozGOaxnMMRLRjhQqckTsMdtjDiFZyr9nP2BJ1L3cR5RTh+IbW3210coBD6p8KYKIq20LyK3mr6K0sXvDNGyV5YqcfMI5eA4HXy2ZdXTnrH+58s9MBW+qg9/CHZ2zI2H1ko8Q8=')));


// add a pageclass from menu item to body tag 
$pageclass =  & $app->getParams('com_content');

   
/////  Bottom Modules  ////////////////////////////////////////////////////////////////////////////////////
$bottommodule = 0;
if($this->countModules('bottom1')) $bottommodule += 1;
if($this->countModules('bottom2')) $bottommodule += 1;
if($this->countModules('bottom3')) $bottommodule += 1;
if($this->countModules('bottom4')) $bottommodule += 1;

switch ($bottommodule) {
	case 1:
		$botmodwidth = "width100";
		break;
	case 2:
		$botmodwidth = "width50";
		break;
	case 3:
		$botmodwidth = "width33";
		break;
	case 4:
		$botmodwidth = "width25";
		break;	
	default:
		$botmodwidth = "";
}

$botmodsep1 = "";
$botmodsep2 = "";
$botmodsep3 = "";


if ($this->countModules('bottom1') && ($this->countModules('bottom2') || $this->countModules('bottom3') || $this->countModules('bottom4'))) {
	$botmodsep1 = "separator";
}

if ($this->countModules('bottom2') && ($this->countModules('bottom3') || $this->countModules('bottom4'))) {
	$botmodsep2 = "separator";
}

if ($this->countModules('bottom3') && ($this->countModules('bottom4'))) {
	$botmodsep3 = "separator";
}



/////  Footer Modules  ////////////////////////////////////////////////////////////////////////////////////
$footermodule = 0;
if($this->countModules('footer1')) $footermodule += 1;
if($this->countModules('footer2')) $footermodule += 1;
if($this->countModules('footer3')) $footermodule += 1;
if($this->countModules('footer4')) $footermodule += 1;
if($this->countModules('footer5')) $footermodule += 1;

switch ($footermodule) {
	case 1:
		$footermodulewidth = "width100";
		break;
	case 2:
		$footermodulewidth = "width50";
		break;
	case 3:
		$footermodulewidth = "width33";
		break;	
	case 4:
		$footermodulewidth = "width25";
		break;
	case 5:
		$footermodulewidth = "width20";
		break;	
	default:
		$footermodulewidth = "";
}

$footermodsep1 = "";
$footermodsep2 = "";
$footermodsep3 = "";
$footermodsep4 = "";

if ($this->countModules('footer1') && ($this->countModules('footer2') || $this->countModules('footer3') || $this->countModules('footer4') || $this->countModules('footer5'))) {
	$footermodsep1 = "separator";
}

if ($this->countModules('footer2') && ($this->countModules('footer3') || $this->countModules('footer4') || $this->countModules('footer5'))) {
	$footermodsep2 = "separator";
}

if ($this->countModules('footer3') && ($this->countModules('footer4') || $this->countModules('footer5'))) {
	$footermodsep3 = "separator";
}

if ($this->countModules('footer4') && ($this->countModules('footer5'))) {
	$footermodsep4 = "separator";
}



/////  Promo Modules  ////////////////////////////////////////////////////////////////////////////////////
$promomodule = 0;
if($this->countModules('promo1')) $promomodule += 1;
if($this->countModules('promo2')) $promomodule += 1;
if($this->countModules('promo3')) $promomodule += 1;

switch ($promomodule) {
	case 1:
		$promomodulewidth = "width100";
		break;
	case 2:
		$promomodulewidth = "width50";
		break;
	case 3:
		$promomodulewidth = "width33";
		break;
	default:
		$promomodulewidth = "";
}

$promomodsep1 = "";
$promomodsep2 = "";


if ($this->countModules('promo1') && ($this->countModules('promo2') || $this->countModules('promo3'))) {
	$promomodsep1 = "separator";
}

if ($this->countModules('promo2') && ($this->countModules('promo3'))) {
	$promomodsep2 = "separator";
}


/////  Showcase  Modules  ////////////////////////////////////////////////////////////////////////////////////
$showcasemodule = 0;
if($this->countModules('showcase1')) $showcasemodule += 1;
if($this->countModules('showcase2')) $showcasemodule += 1;
if($this->countModules('showcase3')) $showcasemodule += 1;
if($this->countModules('showcase4')) $showcasemodule += 1;

switch ($showcasemodule) {
	case 1:
		$showcasemodulewidth = "width100";
		break;
	case 2:
		$showcasemodulewidth = "width50";
		break;
	case 3:
		$showcasemodulewidth = "width33";
		break;
	case 4:
		$showcasemodulewidth = "width25";
		break;
	default:
		$showcasemodulewidth = "";
}

$showcasemodsep1 = "";
$showcasemodsep2 = "";
$showcasemodsep3 = "";


if ($this->countModules('showcase1') && ($this->countModules('showcase2') || $this->countModules('showcase3') || $this->countModules('showcase4'))) {
	$showcasemodsep1 = "separator";
}

if ($this->countModules('showcase2') && ($this->countModules('showcase3') || $this->countModules('showcase4') )) {
	$showcasemodsep2 = "separator";
}

if ($this->countModules('showcase3') && ($this->countModules('showcase4'))) {
	$showcasemodsep3 = "separator";
}


// Get sitename 
$conf =& JFactory::getConfig();
$sitename = $conf->getValue('config.sitename');


// Cookies
$cookie_prefix = "it-corporate";
$cookie_time = time()+30000000;
$ice_temp = array('TemplateStyle');

foreach ($ice_temp as $tprop) {
    $ice_session = &JFactory::getSession();
	
	if (isset($_REQUEST[$tprop])) {
	    $$tprop = JRequest::getString($tprop, null, 'get');
    	$ice_session->set($cookie_prefix.$tprop, $$tprop);
		JRequest::setVar($cookie_prefix. $tprop,  $$tprop, 'COOKIE', 'STRING');
     setcookie ($cookie_prefix. $tprop, $$tprop, $cookie_time, '/', false);
    }
}


$Default_TemplateStyle 			= $this->params->get("TemplateStyle", "style1");

// Layout
$layout_leftcol_width			= $this->params->get("layout_leftcol_width", "192");
$layout_rightcol_width			= $this->params->get("layout_rightcol_width", "192");

$fix_content_inside				= ($this->countModules('icetabs', 1)  == 0)?"false":"true"; 
$fix_content					= ($this->countModules('left', 1)  == 0)?"false":"true"; 


$content_inside_width 			= 960 - $layout_leftcol_width; 



$social_fb						= $this->params->get("social-facebook-username", "IceTheme");
$social_tw						= $this->params->get("social-twitter-username", "IceTheme");
$social_yt						= $this->params->get("social-youtube-username", "IceTheme");
$social_my						= $this->params->get("social-myspace-username", "IceTheme");
$social_fl						= $this->params->get("social-flickr-username", "IceTheme");
		

?>
