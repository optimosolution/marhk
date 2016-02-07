<?php
// No direct access.
defined('_JEXEC') or die;

$TemplateStyle = $Default_TemplateStyle;

$mainurl = $_SERVER['PHP_SELF'] . rebuildQueryString($ice_temp);

foreach ($ice_temp as $tprop) {
    $ice_session = JFactory::getSession();


    if ($ice_session->get($cookie_prefix.$tprop)) {
        $$tprop = $ice_session->get($cookie_prefix.$tprop);
    } elseif (isset($_COOKIE[$cookie_prefix. $tprop])) {
    	$$tprop = JRequest::getVar($cookie_prefix. $tprop, '', 'COOKIE', 'STRING');
    }    
}


function rebuildQueryString($ice_temp) {

  if (!empty($_SERVER['QUERY_STRING'])) {
      $parts = explode("&", $_SERVER['QUERY_STRING']);
      $newParts = array();
      foreach ($parts as $val) {
          $val_parts = explode("=", $val);
          if (!in_array($val_parts[0], $ice_temp)) {
            array_push($newParts, $val);
          }
      }
      if (count($newParts) != 0) {
          $qs = implode("&amp;", $newParts);
      } else {
          return "?";
      }
      return "?" . $qs . "&amp;";
  } else {
      return "?";
  } 
}
?>