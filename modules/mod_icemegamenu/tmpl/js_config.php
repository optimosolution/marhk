<script type="text/javascript">
  jQuery(function(){
	var SelfLocation = window.location.href.split('?');
	var options = {
		activate_action:"<?php echo $activate_action;?>",
		deactivate_action:"<?php echo $deactivate_action;?>",
		show_method:"<?php echo $show_method;?>",
		hide_method:"<?php echo $hide_method;?>",
		justify:"<?php echo $justify;?>",
		enable_js_shadow: <?php echo $enable_js_shadow == '1'?'true':'false';?>,
		shadow_size:<?php echo $shadow_size;?>,
		mm_timeout: <?php echo $mm_timeout;?>
	};
	switch (SelfLocation[1]) {
	  case "justify_right":
		options.justify = 'right';
		jQuery(".icemegamenu").megamenu(options);
		break;
	  case "justify_left":
	  default:
		options.justify = "left";
		jQuery(".icemegamenu").megamenu(options);
		break;
	}
  });
</script>