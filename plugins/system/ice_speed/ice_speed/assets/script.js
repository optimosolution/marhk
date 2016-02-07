window.addEvent('load', function(){
	if( $defined(document.getElement('.it-btn-clearcache a')) ) {
		/**
		 * create a simple box
		 */
		var itbox = new Element('div', {'class':'it-box','style':'visibility:hidden'} );
		var itmessage =  new Element('div', {'class':'it-message'});
			itbox.adopt( itmessage );
			document.getElement('body').adopt(itbox);
		var top = itbox.getTop();
		var itboxfx = new Fx.Tween(itbox, {onComplete:function(){ itbox.setStyle('top',top) } } );
		itboxfx.start('opacity',0,0);
		document.getElement('.it-btn-clearcache a').addEvent('click' , function(e){
			itmessage.set('html','<div class="loading">Loading...</div>');
			itboxfx.start('opacity',0,1);			
			
			var ajx = new Request({url:this.href+"&tmpl=component", method:'post',
				onSuccess: function(data){
					(itmessage.set('html','Cache Cleared Successful'));
						(function(){
							$(itbox).setStyles({top:[ itbox.getTop(),itbox.getTop()-80]});
							itboxfx.start({opacity:[1,0], top:[ itbox.getTop(),itbox.getTop()-80]}) 
						} ).delay(1500);
				}
			}).send();
			return;
		});	
	}
	
	// add event addrow

	document.getElements('.it-addrow-block .add').each( function( item, idx ){
		item.addEvent('click', function( ){
			var name   = "jform[params]["+item.getProperty('id').replace('btna-','')+"][]";
			var newrow = new Element('div', {'class':'row'} );	
			var input  = new Element('input', {'name':name,'type':'text'} );
			var span   = new Element('span',{'class':'remove'}); 
				newrow.adopt( input );
				newrow.adopt( span );
			item.getParent().getParent().adopt( newrow );		
			span.addEvent('click', function(){ 
				if( span.getParent().getElement('input').value ) {
					if( confirm('Are you sure to remove this') ) {
						span.getParent().empty(); 
					}
				} else {
					span.getParent().empty(); 
				}
				updateHeight();
			} );				 
			updateHeight();
				    
		} );
	} );
	document.getElements('.it-addrow-block .row').each(function( item ){
		item.getElement('.remove').addEvent('click', function() {
			if( item.getElement('input').value ) {
				if( confirm('Are you sure to remove this') ) {
					item.getParent().empty();
				}
			}else {
				item.getParent().empty();
			}
			updateHeight();
		} );
	});
} );
function updateHeight()
{
	$$('.jpane-slider').each(function(el){
			if(el.offsetHeight>0){
				el.setStyle('height', el.getElement('fieldset.panelform').offsetHeight);
			}
		});
		window.fireEvent('resize');
}
