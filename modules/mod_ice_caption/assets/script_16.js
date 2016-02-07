/*---------------------------------------------------------------- 
  Copyright:
  (C) 2008 - 2010 IceTheme
  
  License:
  GNU/GPL http://www.gnu.org/copyleft/gpl.html
  
  Author:
  IceTheme - http://wwww.icetheme.com
---------------------------------------------------------------- */
CaptionBoxSlide = new Class({
	initialize: function(options) {
		// options setting.
		this.options = $extend({
			mode		   : "caption", 	
			wrapperId	   : null,	    	
			itemClass	   : "ice-caption",
			itemCoverClass : "ice-caption-cover",
			eventRaising   : "hover",     
			start		   : 20,		 
			end            : 200,         
			fullsize 	   : 0,           
			opacity	       : 80 ,
			duration:250
		}, options || {});

		var fx  	= Array();
		// events as default 
		this.events = {onclick : ['click','click'], hover:['mouseenter',  'mouseleave']};
		//there're modes as default
		this.modes = {
		   caption	 : ["height"], 
		   sideright : ["left"], 
		   sideleft  : ["left"], 
		   sidedown	 : ['top'],
		   sidetop	 : ['top'],
		   botleft   : ['top'] 
		};
		
		var itemsOpacity = $$("#"+this.options.wrapperId+" .ice-opacity");	
		var items 		 = $$("#"+this.options.wrapperId+" ." + this.options.itemClass);
		var itemsCover 	 = $$("#"+this.options.wrapperId+" ." + this.options.itemCoverClass);
		
		if($defined(itemsOpacity)) { 
			itemsOpacity.setStyles({'opacity': this.options.opacity/100, 'filter':'alpha(opacity='+this.options.opacity+')'});
		}
		
		if($defined(itemsCover)) {
			items.setStyle("display","block");
			// using for auto fulsize mode
			if(this.options.fullsize == 1) {
				this.options.start = 0;
				if(this.modes[this.options.mode][0] == 'left') {
					this.options.end = items[0].offsetWidth; 
				} else {
					this.options.end = items[0].offsetHeight;
				}
			}
			
			var wwidth 	= 0;
			var wheight = 0;
			itemsCover.each(function(item, index) {
				//fx[index] = new Fx.Morph(item, {transition:this.options.xtransition, duration:this.options.duration, wait: false});				
				fx[index] = new Fx.Morph(item, {transition:Fx.Transitions.linear, duration:200, wait: false});				
				wwidth  += item.getParent().offsetWidth;
				wheight += item.getParent().offsetHeight;
			});
			
			//For slide
			var style = this.options.style;
			(style == 'horizontal') ? $('ice-caption-slide').setStyle('width', wwidth+'px') : $('ice-caption-slide').setStyle('height', wheight+'px');
			(style == 'horizontal') ? $('ice-caption-slide').setStyle('left', 0) : $('ice-caption-slide').setStyle('top', 0);
			var slide = new Fx.Morph('ice-caption-slide', {transition:this.options.xtransition, duration:this.options.duration, wait: false});
			
			$('ice-caption-previous').addEvent('click', function() {
				if(style == 'horizontal')
				{
					cleft 	= $('ice-caption-slide').getStyle('left').toInt();
					pwidth	= $('ice-caption-slide').getParent().getStyle('width').toInt();
					nleft	= pwidth + cleft;
					(cleft) ? slide.cancel().start({'left':[cleft, nleft]}) : "";
				} else {
					ctop 	= $('ice-caption-slide').getStyle('top').toInt();
					pheight	= $('ice-caption-slide').getParent().getStyle('height').toInt();
					ntop	= pheight + ctop;
					(ctop) ? slide.cancel().start({'top':[ctop, ntop]}) : "";
				}
			});
			$('ice-caption-next').addEvent('click', function() {
				if(style == 'horizontal')
				{
					cleft 	= $('ice-caption-slide').getStyle('left').toInt();
					pwidth	= $('ice-caption-slide').getParent().getStyle('width').toInt();
					nleft	= cleft - pwidth;
					(wwidth > -nleft) ? slide.cancel().start({'left':[cleft, nleft]}) : slide.cancel().start({'left':[cleft, 0]});
				} else {
					ctop 	= $('ice-caption-slide').getStyle('top').toInt();
					pheight	= $('ice-caption-slide').getParent().getStyle('height').toInt();
					mheight = $('ice-caption-slide').getStyle('height').toInt();
					ntop	= ctop - pheight;
					(mheight > -ntop) ? slide.cancel().start({'top':[ctop, ntop]}) : slide.cancel().start({'top':[ctop, 0]});
				}
			});
			
			var params = {'items':items, 'itemsCover': itemsCover, 'fx': fx};
			return this.__callMethod("sildingContent", params);
		}	
	},
	
	__callMethod:function(methodName, param) {
		// if method animation existed
		try{
			if($defined(this[methodName])){
				return this[methodName](param);	
			}
			return true;
		} catch(ex) {
			throw("JASlidingBox : has runtime error, it is in the ''"+methodName+"'() method', please check again.");
		} 	
		return false;
	},
	
	getFxObjectByMode: function(mode, start, end) {
		switch(mode) {
			case 'sideright' : return {'left': [start, -end]} ; break;
			case 'sideleft'  : return {'left': [start, end] } ; break;	
			case 'sidetop'   : return {'top':  [start, end]  } ; break;
			case 'sidedown'  : return {'top':  [start, -end] } ;  break;	
			case 'botleft' : return	{'top': start , 'left': end } ;  break;	
			default: return {'height': [start, end]};		break;		
		}
	},
	
	sildingContent:function(params){
		params['items'].each(function(item, index) {
			item.addEvent(this.events[this.options.eventRaising][0], function() {
				//start run animation
				var obj = {};
				obj 	= this.getFxObjectByMode(this.options.mode, this.options.start, this.options.end);
				params['fx'][index].cancel().start(obj);
				
				// disable other animation	
				params['itemsCover'].each(function(other, jindex) {
					if(index != jindex) {
						var end = other.getStyle(this.modes[this.options.mode][0]).toInt();
						if(end != this.options.start) {
							var obj = {};
							obj 	= this.getFxObjectByMode(this.options.mode, end, this.options.start);
							params['fx'][jindex].cancel().start(obj);
						}
					}
				}.bind(this));
			}.bind(this));
			
			item.addEvent(this.events[this.options.eventRaising][1], function() {
				// disable all animation	
				params['itemsCover'].each(function(other, jindex) {
					var obj = {};
					var end = other.getStyle(this.modes[this.options.mode][0]).toInt();
					obj		= this.getFxObjectByMode(this.options.mode, end, this.options.start);
					params['fx'][jindex].cancel().start(obj);
				}.bind(this));
			}.bind(this));
			
			// set default
			params['itemsCover'][index].setStyle(this.modes[this.options.mode][0], this.options.start);
		}.bind(this));
	}
});