/*---------------------------------------------------------------- 
  Copyright:
  (C) 2008 - 2010 IceTheme
  
  License:
  GNU/GPL http://www.gnu.org/copyleft/gpl.html
  
  Author:
  IceTheme - http://wwww.icetheme.com
---------------------------------------------------------------- */
if( typeof imageAccordionPreview !== "function"){
	function imageAccordionPreview( _icemain ){
		var t = new Tips('.iceaccordion .iceAccordionTip');
		_icemain.getElements('.iceaccordion .iceAccordionTip').each(function(tip){
			var imgSrc = tip.retrieve('tip:text');
			var imgAlt = tip.retrieve('tip:title');
			var imgWidth = tip.get("width");
			var imgHeight = tip.get("height");
			tip.store('tip:text', new Element('img',{'src':imgSrc,'alt':imgAlt,'width':imgWidth,'height':imgHeight}));
		});
	}
}
window.addEvent('load', function() {
	addPagingEvent();
	$$(".iceaccordion").each( function( item ){
		var myAccordion = new Accordion( item, '.toggler', '.accordion_content', {
			opacity: false,
			alwaysHide:true,
			display: start_index,
			onActive: function(toggler, element){
				toggler.addClass('open');
			},
			onBackground: function(toggler, element){
				toggler.removeClass('open');
			}
		});
	} );
});