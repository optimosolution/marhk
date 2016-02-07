// JavaScript Document
window.addEvent('load', function(){
 	$$("#module-sliders .panel").each( function(item, i){
		var class_name= i%2==0?"lof-odd":"lof-even";
		item.addClass( class_name );
	} );
 	
 	$$("#jform_params_data_source").addEvent("change",function(){
 		updateSource();
 	});
	$$("#jform_params_source_from").addEvent("change",function(){
 		updateSourceFrom("jform_params_source_from");
 	});
	$$("#jform_params_ip_source_from").addEvent("change",function(){
 		updateSourceFrom("jform_params_ip_source_from");
 	});
 	updateSource();
	updateSourceFrom( "jform_params_source_from" );
	updateSourceFrom( "jform_params_ip_source_from" );
	function updateSource(){
	 	 $$("#jform_params_data_source option").each( function(item){
	 		var tmp = $$("#"+(item.value+"SETTING").toUpperCase()+"-options").getParent();
	 		if( item.selected ){
	 			tmp.show();
				if(item.get("value") == "content"){
					$$("#filtering-options").getParent().show();
					$$("#ordering-options").getParent().show();
					$$("#display-options").getParent().show();
				}
				else if(item.get("value") == "joomshopping"){
					$$("#filtering-options").getParent().hide();
					$$("#ordering-options").getParent().hide();
					$$("#display-options").getParent().hide();
				}
				else{
					$$("#filtering-options").getParent().hide();
					$$("#ordering-options").getParent().hide();
					$$("#display-options").getParent().hide();
				}
				//alert(item.get("value"));
	 		} else {
	 			tmp.hide();
	 		}
	 	 } );
	}
	function updateSourceFrom( id ){
		 $$("#"+id+" option").each( function(item){
			var tmp = ($$("."+item.value ) || $$("#"+item.value)).getParent();
			if( item.selected ){
				tmp.show();
			}
			else{
				tmp.hide();
			}
		 });
	}	
 	 
} );

$(window).addEvent( 'load', function(){
								
	$$(".lof-cbktoggle").each( function(item){
		item.addEvent( 'click', function(){
			if(item.checked){
				$$("#toggle-"+item.id).show();
			} else {
				$$("#toggle-"+item.id).hide();
			}
		} );
		
		if(item.checked){
			$$("#toggle-"+item.id).show();
		} else {
			$$("#toggle-"+item.id).hide();
		}
			
			
	} );
			
	// add event addrow
	$$('.it-addrow-block .add').each( function( item, idx ){ 
		item.addEvent('click', function( ){
			var name   = "jform[params]["+item.getProperty('id').replace('btna-','')+"][]"
			var newrow = new Element('div', {'class':'row'} );	
			var input  = new Element('input', {'name':name,'type':'text'} );
			var span   = new Element('span',{'class':'remove'});
			var spantext   = new Element('span',{'class':'spantext'}); 
				newrow.adopt( spantext );	
				newrow.adopt( input );	
				newrow.adopt( span );			
			var parent = item.getParent().getParent();	
			parent.adopt( newrow );	
			spantext.innerHTML= parent.getElements('input').length;	
			span.addEvent('click', function(){ 
											
				if( span.getParent().getElement('input').value ) {
					if( confirm('Are you sure to remove this') ) {
						span.getParent().dispose(); 
					}
				} else {
					span.getParent().dispose(); 
				}
				setTimeout( function(){ $E('.jpane-slider ').setStyle( 'height', $E('.paramlist').offsetHeight );
																		parent.getElements('.spantext').each( function(tm,j){
																			tm.innerHTML=j+1;											   
																		});					
				}, 300 );
			} );				 
			setTimeout( function(){
				//	$E('.jpane-slider ').setStyle( 'height', $E('.paramlist').offsetHeight );
			//		parent.getElements('.spantext').each( function(tm,j){tm.innerHTML=j+1;});	
					
			}, 300 );
				    
		} );
	} );
	$$('.it-addrow-block .row').each(function( item ){
		item.getElement('.remove').addEvent('click', function() {
			if( item.getElement('input').value ) {
				if( confirm('Are you sure to remove this') ) {
					item.dispose();
				}
			}else {
				item.dispose();
			}
		//	setTimeout( function(){ $E('.jpane-slider ').setStyle( 'height', $E('.paramlist').offsetHeight );}, 300 );
		} );
	});
} );

