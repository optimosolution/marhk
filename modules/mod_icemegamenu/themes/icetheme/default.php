<?php
$icemegamenu->render($params, 'modIceMegaMenuXMLCallback');

if($use_ij):
?>
<script type="text/javascript">
    window.addEvent('domready', function() {            
            var myMenu = new MenuMatic({id:'icemegamenu'
        });
    });
</script>
<?php
 endif;
?>