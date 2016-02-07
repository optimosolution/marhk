<?php
//  @copyright	Copyright (C) 2008 - 2011 IceTheme. All Rights Reserved
//  @license	Copyrighted Commercial Software 
//  @author     IceTheme (icetheme.com)

// No direct access.
defined('_JEXEC') or die;

// Add CSS
$doc =&JFactory::getDocument();
$doc->addStyleSheet($this->baseurl. '/templates/system/css/system.css');
$doc->addStyleSheet($this->baseurl. '/templates/system/css/general.css');
$doc->addStyleSheet($this->baseurl. '/templates/' .$this->template. '/css/reset.css');
$doc->addStyleSheet($this->baseurl. '/templates/' .$this->template. '/css/typography.css');
$doc->addStyleSheet($this->baseurl. '/templates/' .$this->template. '/css/forms.css');
$doc->addStyleSheet($this->baseurl. '/templates/' .$this->template. '/css/modules.css');
$doc->addStyleSheet($this->baseurl. '/templates/' .$this->template. '/css/joomla.css');
$doc->addStyleSheet($this->baseurl. '/templates/' .$this->template. '/css/layout.css');
?>


<style type="text/css" media="screen">

/* Select the style */
/*\*/@import url("<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/<?php echo $TemplateStyle; ?>.css");/**/


<?php if ($this->countModules('left')) { ?>
/* Left Columns Parameters */
#left-column { width: <?php echo $layout_leftcol_width ?>px;}
<?php } ?>	

<?php if ($this->countModules('right')) { ?>
/* Right Column Parameters */
#outer-column-container { border-right-width:<?php echo $layout_rightcol_width ?>px;	}
#right-column { margin-right: -<?php echo $layout_rightcol_width ?>px; width: <?php echo $layout_rightcol_width ?>px;}
#inner-column-container { border-right-color: #ccc;}
<?php } ?>	


/*adjust the width based from the width set for the "left" column */
#content_inside {
	width:<?php echo $content_inside_width; ?>px}

/*adjust the margin based from the width set for the "left" column */
#breadcrumbs {
	margin-left:<?php echo $layout_rightcol_width ?>px;}

<?php if($this->countModules('promo1 + promo2 + promo3') and $fix_content_inside=="false" or $fix_content=="false") : ?>
/* Check if the promo modules are enabled
and icetabs module is disabled to enhance the layout */
#content_inside:before {
	display:none;
	background:none;}
#content_inside {
	border-top-left-radius:0;}	
#promo {
	margin-top:-15px}		
<?php endif; ?>	


<?php if ($fix_content=="false") : ?>
/* Check if the "left" modules are
disabled */
#promo {
	background-image:none}
#content_inside {
	width:100%;}
#breadcrumbs {
	margin-left:0}

#promo .width33 { width:31.8%}
#promo .width50 { width:48.9%}		
<?php endif; ?>	


#left-column  .col-module h3.mod-title span {
	right:<?php echo $layout_leftcol_width + 75; ?>px;}
#left-column  .col-module:hover h3.mod-title span {
	right:<?php echo $layout_leftcol_width + 45; ?>px;}

</style>	

<!-- Google Fonts -->
<link href="http://fonts.googleapis.com/css?family=PT+Sans:regular,italic,bold,bolditalic" rel="stylesheet" type="text/css" />

<!--[if lte IE 8]>
<link rel="stylesheet" type="text/css" href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/ie.css" />
<![endif]-->

<!--[if lte IE 9]>
<style type="text/css" media="screen">
#left-column  .col-module h3.mod-title span:after {
	border-width: 0.82em;
</style>	
<![endif]-->
