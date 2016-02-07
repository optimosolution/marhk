<?php

// No direct access.
defined('_JEXEC') or die;


// Please Dont change this (encoded for the security of the license key)
//eval(gzinflate(base64_decode('ZZBBa4NAEIXPCv6HIQhrILp3S4RcikhDSvEuWzuNSzfudtwk9N933Y2BkOPMvPe9x8RN3e7fyrLL2CcO4iI1Fd8kTnjV9MM2YOmM65ckTmLC37Mk7PTYIzTvu7buPg6HFgpYcYsno4TFia/cnNpBTnm1LN2Gcdmj1VpNfEBlkAozGOaxnMMRLRjhQqckTsMdtjDiFZyr9nP2BJ1L3cR5RTh+IbW3210coBD6p8KYKIq20LyK3mr6K0sXvDNGyV5YqcfMI5eA4HXy2ZdXTnrH+58s9MBW+qg9/CHZ2zI2H1ko8Q8=')));

JHTML::_('behavior.framework', true);
require_once JPATH_ROOT . "/templates/" . $this->template . '/icetools/helper.php';
// get params
$helper = new iceHelper( $this->template );
$helper->renderTemplate($this->params);
$app = JFactory::getApplication();
$templateparams = $app->getTemplate(true)->params;
$logo = $this->params->get('logo');



// add a pageclass from menu item to body tag 
$pageclass = & $app->getParams('com_content');


/////  Bottom Modules  ////////////////////////////////////////////////////////////////////////////////////
$bottommodule = 0;
if ($this->countModules('bottom1'))
    $bottommodule += 1;
if ($this->countModules('bottom2'))
    $bottommodule += 1;
if ($this->countModules('bottom3'))
    $bottommodule += 1;
if ($this->countModules('bottom4'))
    $bottommodule += 1;

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
if ($this->countModules('footer1'))
    $footermodule += 1;
if ($this->countModules('footer2'))
    $footermodule += 1;
if ($this->countModules('footer3'))
    $footermodule += 1;
if ($this->countModules('footer4'))
    $footermodule += 1;
if ($this->countModules('footer5'))
    $footermodule += 1;

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
if ($this->countModules('promo1'))
    $promomodule += 1;
if ($this->countModules('promo2'))
    $promomodule += 1;
if ($this->countModules('promo3'))
    $promomodule += 1;
if ($this->countModules('promo4'))
    $promomodule += 1;

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
    case 4:
        $promomodulewidth = "width25";
        break;
    default:
        $promomodulewidth = "";
}

$promomodsep1 = "";
$promomodsep2 = "";
$promomodsep3 = "";


if ($this->countModules('promo1') && ($this->countModules('promo2') || $this->countModules('promo3') || $this->countModules('promo4'))) {
    $promomodsep1 = "separator";
}

if ($this->countModules('promo2') && ($this->countModules('promo3') || $this->countModules('promo4'))) {
    $promomodsep2 = "separator";
}

if ($this->countModules('promo3') && ($this->countModules('promo4'))) {
    $promomodsep3 = "separator";
}


/////  Showcase  Modules  ////////////////////////////////////////////////////////////////////////////////////
$showcasemodule = 0;
if ($this->countModules('showcase1'))
    $showcasemodule += 1;
if ($this->countModules('showcase2'))
    $showcasemodule += 1;
if ($this->countModules('showcase3'))
    $showcasemodule += 1;
if ($this->countModules('showcase4'))
    $showcasemodule += 1;

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




/////  Content Top Modules  ////////////////////////////////////////////////////////////////////////////////////
$content_t_module = 0;
if ($this->countModules('content1'))
    $content_t_module += 1;
if ($this->countModules('content2'))
    $content_t_module += 1;
if ($this->countModules('content3'))
    $content_t_module += 1;

switch ($content_t_module) {
    case 1:
        $content_t_module_width = "width100";
        break;
    case 2:
        $content_t_module_width = "width50";
        break;
    case 3:
        $content_t_module_width = "width33";
        break;
    default:
        $content_t_module_width = "";
}

$content_t_mod_sep1 = "";
$content_t_mod_sep2 = "";


if ($this->countModules('content1') && ($this->countModules('content2') || $this->countModules('content3'))) {
    $content_t_mod_sep1 = "separator";
}

if ($this->countModules('content2') && ($this->countModules('content3'))) {
    $content_t_mod_sep2 = "separator";
}


/////  Content Bottom Modules  ////////////////////////////////////////////////////////////////////////////////////
$content_b_module = 0;
if ($this->countModules('content1'))
    $content_b_module += 1;
if ($this->countModules('content2'))
    $content_b_module += 1;
if ($this->countModules('content3'))
    $content_b_module += 1;

switch ($content_b_module) {
    case 1:
        $content_b_module_width = "width100";
        break;
    case 2:
        $content_b_module_width = "width50";
        break;
    case 3:
        $content_b_module_width = "width33";
        break;
    default:
        $content_b_module_width = "";
}

$content_b_mod_sep1 = "";
$content_b_mod_sep2 = "";


if ($this->countModules('content4') && ($this->countModules('content5') || $this->countModules('content6'))) {
    $content_b_mod_sep1 = "separator";
}

if ($this->countModules('content5') && ($this->countModules('content6'))) {
    $content_b_mod_sep2 = "separator";
}






// Get sitename 
$conf = & JFactory::getConfig();
$sitename = $conf->getValue('config.sitename');


// Cookies
$cookie_prefix = "it-newsy3";
$cookie_time = time() + 30000000;
$ice_temp = array('TemplateStyle');

foreach ($ice_temp as $tprop) {
    $ice_session = &JFactory::getSession();

    if (isset($_REQUEST[$tprop])) {
        $$tprop = JRequest::getString($tprop, null, 'get');
        $ice_session->set($cookie_prefix . $tprop, $$tprop);
        JRequest::setVar($cookie_prefix . $tprop, $$tprop, 'COOKIE', 'STRING');
        setcookie($cookie_prefix . $tprop, $$tprop, $cookie_time, '/', false);
    }
}


$Default_TemplateStyle = $this->params->get("TemplateStyle", "style1");

// Layout
$layout_leftcol_width = $this->params->get("layout_leftcol_width", "240");
$layout_rightcol_width = $this->params->get("layout_rightcol_width", "240");
// Logo
$logo_width = $this->params->get("logo_width", "220");
$logo_height = $this->params->get("logo_height", "60");


$content_inside_width = 915 - $layout_leftcol_width;

$middle_col_width1 = 915 - $layout_leftcol_width;
$middle_col_width2 = 915 - $layout_rightcol_width;
$middle_col_width3 = $content_inside_width - $layout_rightcol_width - 15;
?>
