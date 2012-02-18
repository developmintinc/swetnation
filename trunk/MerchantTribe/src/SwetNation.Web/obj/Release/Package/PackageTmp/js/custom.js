jQuery.noConflict()(function($){
$(document).ready(function()
{
	$(".slide-down-gallery").css('opacity', '0');
	$(".slide-down-gallery").animate({opacity:'1'},{duration:100});
	$(".slide-down-gallery").hover
	(
		function()
		{
			$(this).children(".text_slider").animate({top:(90-$(this).children(".text_slider").height())+"px"},{queue:false,duration:200});
		}
		,function()
		{
			$(this).children(".text_slider").animate({top:"100px"},{queue:false,duration:350});
		}
	);

});
});
jQuery.noConflict()(function($){
$(document).ready(function()
{
	$(".slider-down").css('opacity', '0');
	$(".slider-down").animate({opacity:'1'},{duration:200});
	$(".slider-down").hover
	(
		function()
		{
			$(this).children(".text_slider").animate({top:(360-$(this).children(".text_slider").height())+"px"},{queue:false,duration:200});
		}
		,function()
		{
			$(this).children(".text_slider").animate({top:"360px"},{queue:false,duration:350});
		}
	);

});
});

jQuery.noConflict()(function($){
$(document).ready(function() {
	
			$('.fancy-error,.fancy-notice,.fancy-info,.fancy-success,.fancy-download,.fancy-secure-area').click(function() {
                $(this).fadeOut(800);
            });
			
        });
        });
jQuery.noConflict()(function($){
$(document).ready(function() {
		$("#nav-shadow li").hover(function() {
			var e = this;
		    $(e).find("a").stop().animate({ marginTop: "-14px" }, 250, function() {
		    	$(e).find("a").animate({ marginTop: "-10px" }, 250);
		    });
		    $(e).find("img.shadow").stop().animate({ width: "80%", height: "20px", marginLeft: "8px", opacity: 0.25 }, 250);
		},function(){
			var e = this;
		    $(e).find("a").stop().animate({ marginTop: "4px" }, 250, function() {
		    	$(e).find("a").animate({ marginTop: "0px" }, 250);
		    });
		    $(e).find("img.shadow").stop().animate({ width: "100%", height: "27px", marginLeft: "0", opacity: 1 }, 250);
		});
					
	});
	});
	jQuery.noConflict()(function($){
$(document).ready(function() { 
	$('#social-01').tipsy({gravity: 'n'});
	$('#social-02').tipsy({gravity: 'n'});
	$('#social-03').tipsy({gravity: 'n'});
	$('#social-04').tipsy({gravity: 'n'});
	$('#social-05').tipsy({gravity: 'n'});
	$('#social-06').tipsy({gravity: 'n'});
	$('#social-07').tipsy({gravity: 'n'});
	$('#social-08').tipsy({gravity: 'n'});
	$('#social-09').tipsy({gravity: 'n'});
	$('#social-10').tipsy({gravity: 'n'});
	$('#social-11').tipsy({gravity: 'n'});
	$('#social-12').tipsy({gravity: 'n'});
	
	$('#tip-1').tipsy({gravity: 's'});
	$('#tip-2').tipsy({gravity: 's'});
	$('#tip-3').tipsy({gravity: 's'});
	$('#tip-4').tipsy({gravity: 's'});
	$('#tip-5').tipsy({gravity: 's'});
});
})
jQuery.noConflict()(function($){
$(document).ready(function() {
$(".item-hover").hover(function(){
$(this).find(".portfolio-thumbnail,.portfolio-hover-three,.portfolio-hover-two").stop(true, true).animate({ opacity: 'show' }, 1000);
}, function() {
$(this).find(".portfolio-thumbnail,.portfolio-hover-three,.portfolio-hover-two").stop(true, true).animate({ opacity: 'hide' }, 1000);
});
});
});
jQuery.noConflict()(function($){
$(document).ready(function() {
    $('#cycle-slider').cycle({
		fx:     'scrollDown', 
		prev:    '#prev',
        next:    '#next',
		easing: 'bounceout',
		 pause:   0, 
		timeout: 0, 		
		delay:  -2000   
	});
	
	});
});
jQuery.noConflict()(function($){
jQuery("#slider-small").slides({
preload: true,
effect: 'fade',
fadeSpeed: 550,
play: 3000

});
});
jQuery.noConflict()(function($) {
$(document).ready(function() {
$("#accordion-menu > li > div").click(function(){
	if(false == $(this).next().is(':visible')) {
		$('#accordion-menu ul').slideUp(300);
	}
	$(this).next().slideToggle(300);
});
	$('#accordion-menu ul:eq(0)').show();
		});
	});



// jQuery Orbit Slider

jQuery.noConflict()(function($){
		jQuery('#orbit-slider').orbit({
			 animation: 'horizontal-push',                 // fade, horizontal-slide, vertical-slide, horizontal-push
			 animationSpeed: 1000,               // how fast animtions are
			 timer: true, 			 			// true or false to have the timer
			 advanceSpeed: 4000, 				// if timer is enabled, time between transitions 
			 pauseOnHover: false, 				// if you hover pauses the slider
			 startClockOnMouseOut: false,		// if clock should start on MouseOut
			 startClockOnMouseOutAfter: 1000,	// how long after MouseOut should the timer start again
			 directionalNav: true,				// manual advancing directional navs
			 captions: true,					// do you want captions?
			 captionAnimation: 'fade',			// fade, slideOpen, none
			 captionAnimationSpeed: 1000,		// if so how quickly should they animate in
			 bullets: true,						// true or false to activate the bullet navigation
			 afterSlideChange: function(){}		// empty function 
		});
	
});
jQuery.noConflict()(function($){
		jQuery('#roundabout ul').roundabout({
			bearing: 0.0, // The starting direction in which the Roundabout should point.
			tilt: 0.0, // The starting angle at which the Roundabout’s plane should be tipped.
			minZ: 80, // The lowest z-index value that a moveable item can be assigned. (Will be the z-index of the item farthest from the focusBearing.)
			maxZ: 100, // The greatest z-index value that a moveable item can be assigned. (Will be the z-index of the item in focus.)
			minOpacity: 0.8, // The lowest opacity value that a moveable item can be assigned. (Will be the opacity of the item farthest from the focus bearing.)
			maxOpacity: 1.0, // The greatest opacity value that a moveable item can be assigned. (Will be the opacity of the item in focus.)
			minScale: 0.4, // The lowest percentage of font-size that a moveable item can be assigned. (Will be the scale of the item farthest from the focus bearing.)
			maxScale: 1.3, // The greatest percentage of font-size that a moveable item can be assigned. (Will be the scale of the item in focus.)
			duration: 800, // The length of time (in milliseconds) that all animations take to complete by default.
			easing: 'easeOutExpo', // The easing method to be used for animations by default. jQuery comes with “linear” and “swing,” although any of the jQuery Easing plugin’s values can be used if the easing plugin is included.
			clickToFocus: true, // When an item is not in focus, should it be brought into focus via an animation? If true, will disable any click events on elements within the moving element that was clicked. Once the element is in focus, click events will no longer be blocked.
			focusBearing: 0.0, // The bearing at which a moving item’s position must match on the Roundabout to be considered “in focus.”
			shape: 'square', // For use with the Roundabout Shapes plugin. Sets the shape of the path over which moveable items will travel.
			childSelector: 'li', // Changes the set of elements Roundabout will look for within the holding element for moving.
			startingChild: 6, // Starts a given child at the focus of the Roundabout. This is a zero-based number positioned in order of appearance in the HTML file.
			reflect: false // Setting to true causes the elements to be placed around the Roundabout in reverse order. Also flips the direction of “next” and ”previous” buttons. 
		});
});
jQuery.noConflict()(function($){
jQuery(window).bind("load", function() {
		jQuery('.slideimage:hidden').fadeIn(2000);
		jQuery(".kwicks.horizontal li").css('background', '#FFF');
		jQuery('.accordian-slider-caption').show();
		jQuery('.accordian-slider-captiontitle').show();
		
		jQuery('.kwicks').kwicks({
			max : 875,
			spacing : 0
		});
	jQuery(function(){
		jQuery(".accordian-slider-caption").fadeTo(1, 0);
		jQuery(".slide-minicaption").fadeTo(1, 0.9);
		jQuery(".kwicks").each(function () {
			jQuery(".kwicks").hover(function() {
			jQuery('.accordian-slider-caption').stop().animate({opacity: 0.9, left: '50'}, 900 );
			
			},function(){
			jQuery('.accordian-slider-caption').stop().animate({opacity: 0, left: '930'}, 900 );
			
			});
		});
	});
});
});

jQuery.noConflict()(function($){
$(document).ready(function() { 
$('a.portfolio-item-preview,.find-us').each(function() {
 $(this).removeAttr('data-rel').attr('rel', 'prettyPhoto');
});
})
});
jQuery.noConflict()(function($){
$(document).ready(function() {
$('.kwicks').kwicks({
max : 220,
spacing : 5
});
});
});
jQuery.noConflict()(function($){
$(document).ready(function() {
		$("#nav-shadow li").hover(function() {
			var e = this;
		    $(e).find("a").stop().animate({ marginTop: "-14px" }, 250, function() {
		    	$(e).find("a").animate({ marginTop: "-10px" }, 250);
		    });
		    $(e).find("img.shadow").stop().animate({ width: "80%", height: "20px", marginLeft: "8px", opacity: 0.25 }, 250);
		},function(){
			var e = this;
		    $(e).find("a").stop().animate({ marginTop: "4px" }, 250, function() {
		    	$(e).find("a").animate({ marginTop: "0px" }, 250);
		    });
		    $(e).find("img.shadow").stop().animate({ width: "100%", height: "27px", marginLeft: "0", opacity: 1 }, 250);
		});
					
	});
	});
	


/***************************************************
		CYCLE SLIDER
***************************************************/

jQuery.noConflict()(function($){
$(document).ready(function() {
    $('#grid-portfolio-slider').cycle({
		fx:     'scrollLeft', 
		prev:    '#portfolio-next',
        next:    '#portfolio-prev',
		 pause:   0, 
		timeout: 0, 		
		delay:  -2000   
	});
	
	});
});

/***************************************************
		CYCLE SLIDER
***************************************************/
jQuery.noConflict()(function($){
$(document).ready(function() {
   $('#portfolio-details-3-slider').cycle({
		fx:     'scrollLeft', 
		prev:    '#homepage-portfolio-prev',
        next:    '#homepage-portfolio-next',
		 pause:   0, 
		timeout: 0, 		
		delay:  -2000   
	});
	
	});
});

jQuery.noConflict()(function($){
$(document).ready(function() {
   $('#homepage-slice').cycle({
		fx:     'scrollLeft', 
		prev:    '#homepage-next',
        next:    '#homepage-prev',
		 pause:   0, 
		timeout: 0, 		
		delay:  -2000   
	});
	
	});
});
jQuery.noConflict()(function($){
$(document).ready(function() {
    $('#portfolio-slider').cycle({
		fx:     'scrollLeft', 
		prev:    '#portfolio-prev',
        next:    '#portfolio-next',
		 pause:   0, 
		timeout: 0, 		
		delay:  -2000   
	});
	
	});
});
jQuery.noConflict()(function($){
$(document).ready(function() { 
	$('a.preview').each(function() {
        $(this).removeAttr('data-rel').attr('rel', 'prettyPhoto');
});
})
});


/***************************************************
	    THUMB PORTFOLIO HOVER
***************************************************/

jQuery.noConflict()(function($){
$(document).ready(function() {
 $('#slider3').nivoSlider({
 pauseTime:5000,
 pauseOnHover:false
 }); 
 });
});
jQuery.noConflict()(function($){
$(document).ready(function() {
 $('#slider4').nivoSlider({
 pauseTime:5000,
 pauseOnHover:false,
 controlNavThumbs:true
 });
 });
 });

/*-----------------------------------------FONT STYLER ENDS--------------------------------*/
jQuery.noConflict()(function($){	
	$(document).ready(function() {
	if (jQuery().slides) {
		
		jQuery("#slides").hover( function() {
			jQuery('.slides-nav').fadeIn(400);
		}, function () {
			jQuery('.slides-nav').fadeOut(400);
		});
		
	}
	});	
	});	
/*-----------------SLIDES WITH CAPTION---------------*/
jQuery.noConflict()(function($){	
	$(function(){
			$('#slides').slides({
				effect: 'fade',
				fadeSpeed: 750,
				play: 5000,
				pause: 2500,
				hoverPause: true,
				animationStart: function(current){
					$('.caption').animate({
						
					},100);
					if (window.console && console.log) {
						// example return of current slide number
						console.log('animationStart on slide: ', current);
					};
				},
				animationComplete: function(current){
					$('.caption').animate({
						
					},200);
					if (window.console && console.log) {
						// example return of current slide number
						console.log('animationComplete on slide: ', current);
					};
				},
				slidesLoaded: function() {
					$('.caption').animate({
						
					},200);
				}
			});
		});
		});

jQuery.noConflict()(function($){
$(document).ready(function() {
$(document).ready(function () {
$('#menu').tabify()

});
});
});
jQuery.noConflict()(function($){
$(document).ready(function() {
$('form#contact-form').submit(function() {
$('form#contact-form .error').remove();
var hasError = false;
$('.requiredField').each(function() {
if(jQuery.trim($(this).val()) == '') {
 var labelText = $(this).prev('label').text();
 $(this).parent().append('<div class="error">You forgot to enter your '+labelText+'</div>');
 $(this).addClass('inputError');
 hasError = true;
 } else if($(this).hasClass('email')) {
 var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
 if(!emailReg.test(jQuery.trim($(this).val()))) {
 var labelText = $(this).prev('label').text();
 $(this).parent().append('<div class="error">You entered an invalid '+labelText+'</div>');
 $(this).addClass('inputError');
 hasError = true;
 }
 }
});
if(!hasError) {
$('form#contact-form input.submit').fadeOut('normal', function() {
$(this).parent().append('');
});
var formInput = $(this).serialize();
$.post($(this).attr('action'),formInput, function(data){
$('form#contact-form').slideUp("fast", function() {
$(this).before('<div class="simple-success">Your email was successfully sent. We will contact you as soon as possible.</div>');
});
});
}

return false;

});
});
});

jQuery.noConflict()(function($){
$(document).ready(function($){
$('ul#filterable a').click(function() {
$(this).css('outline','none');
$('ul#filterable .current').removeClass('current');
$(this).parent().addClass('current');

return false;
});
});
});
jQuery.noConflict()(function($){
$(document).ready(function() { 
 $('.portfolio-img').each(function() {
 $(this).hover(
 function() {
 $(this).stop().animate({ opacity: 0.6 }, 400);
 },
 function() {
 $(this).stop().animate({ opacity: 1.0 }, 700);
 })
 });
});
});

jQuery.noConflict()(function($){
$(document).ready(function() { 
$(".tweet").tweet({
	 username: "trendywebstar",
	 join_text: null,
	 avatar_size: null,
	 count: 2,
	 auto_join_text_default: "we said,", 
	 auto_join_text_ed: "we",
	 auto_join_text_ing: "we were",
	 auto_join_text_reply: "we replied to",
	 auto_join_text_url: "we were checking out",
	 loading_text: "loading tweets..."
 });
});
});
jQuery.noConflict()(function($){
$(document).ready(function() {
 $('#slider-two-third').cycle({
fx:'fade',
speedIn: 1000, 
speedOut: 1000, 
delay: 2000
});
});
});
jQuery.noConflict()(function($){
$(document).ready(function() { 
$("a[rel^='prettyPhoto']").prettyPhoto({opacity:0.80,default_width:500,default_height:344,theme:'light_rounded',hideflash:false,modal:false});
});
});
var arrowimages={down:['', ''], right:['', '']}
var jqueryslidemenu={
animateduration: {over: 200, out: 200},
buildmenu:function(menuid, arrowsvar){
jQuery(document).ready(function($){
$(" #main_navigation a").removeAttr("title");
var $mainmenu=$("#"+menuid+">ul")
var $headers=$mainmenu.find("ul").parent()
$headers.each(function(i){
var $curobj=$(this)
var $subul=$(this).find('ul:eq(0)')
this._dimensions={w:this.offsetWidth, h:this.offsetHeight, subulw:$subul.outerWidth(), subulh:$subul.outerHeight()}
this.istopheader=$curobj.parents("ul").length==1? true : false
$subul.css({top:this.istopheader? this._dimensions.h+"px" : 0})

var $targetul=$(this).children("ul:eq(0)")
this._offsets={left:$(this).offset().left, top:$(this).offset().top}
var menuleft=this.istopheader? 0 : this._dimensions.w
menuleft=(this._offsets.left+menuleft+this._dimensions.subulw>$(window).width())? (this.istopheader? -this._dimensions.subulw+this._dimensions.w : -this._dimensions.w) + 12 : menuleft
if ($targetul.queue().length<=1) 
if(menuleft==0){
$targetul.css({left:menuleft+"px", width:this._dimensions.subulw+'px'}).removeClass("menu_flip")
}
if(menuleft!=0 && this.istopheader){
$targetul.css({left:menuleft+"px", width:this._dimensions.subulw+'px'}).addClass("menu_flip")
}else{
$targetul.css({left:menuleft+"px", width:this._dimensions.subulw+'px'}).removeClass("menu_flip")
}
$curobj.hover(
function(e){
var $targetul=$(this).children("ul:eq(0)")
this._offsets={left:$(this).offset().left, top:$(this).offset().top}
var menuleft=this.istopheader? 0 : this._dimensions.w
menuleft=(this._offsets.left+menuleft+this._dimensions.subulw>$(window).width())? (this.istopheader? -this._dimensions.subulw+this._dimensions.w : -this._dimensions.w) + 12 : menuleft
if ($targetul.queue().length<=1) 
if(menuleft==0){
$targetul.css({left:menuleft+"px", width:this._dimensions.subulw+'px'}).removeClass("menu_flip").slideDown(jqueryslidemenu.animateduration.over)
}
if(menuleft!=0 && this.istopheader){
$targetul.css({left:menuleft+"px", width:this._dimensions.subulw+'px'}).addClass("menu_flip").slideDown(jqueryslidemenu.animateduration.over)
}else{
$targetul.css({left:menuleft+"px", width:this._dimensions.subulw+'px'}).removeClass("menu_flip").slideDown(jqueryslidemenu.animateduration.over)
}
},
function(e){
var $targetul=$(this).children("ul:eq(0)")
$targetul.slideUp(jqueryslidemenu.animateduration.out)
}
) 
})
$mainmenu.find("ul").css({display:'none', visibility:'visible'})
})
}
}
jqueryslidemenu.buildmenu("main_navigation", arrowimages)
jQuery.noConflict()(function($){
jQuery(document).ready(function($){
var 
speed = 700, 
$wall = $('#portfolio').find('.portfolio-container ul')
;
$wall.masonry({
singleMode: true,
itemSelector: '.one-fourth:not(.invis)',
animate: true,
animationOptions: {
duration: speed,
queue: false
}
});
$('#filterable a').click(function(){
var colorClass = '.' + $(this).attr('class');
if(colorClass=='.all') {
$wall.children('.invis')
.toggleClass('invis').fadeIn(speed);
} else { 
$wall.children().not(colorClass).not('.invis')
.toggleClass('invis').fadeOut(speed);
$wall.children(colorClass+'.invis')
.toggleClass('invis').fadeIn(speed);
}
$wall.masonry();
 return false;
});
});
});
jQuery.noConflict()(function($){
jQuery(document).ready(function($){
var 
speed = 700, 
$wall = $('#portfolio').find('.portfolio-container ul')
;
$wall.masonry({
singleMode: true,
itemSelector: '.one-third:not(.invis)',
animate: true,
animationOptions: {
duration: speed,
queue: false
}
});
$('#filterable a').click(function(){
var colorClass = '.' + $(this).attr('class');
if(colorClass=='.all') {
$wall.children('.invis')
.toggleClass('invis').fadeIn(speed);
} else { 
$wall.children().not(colorClass).not('.invis')
.toggleClass('invis').fadeOut(speed);
$wall.children(colorClass+'.invis')
.toggleClass('invis').fadeIn(speed);
}
$wall.masonry();
 return false;
});
});
});
jQuery.noConflict()(function($){
jQuery(document).ready(function($){
var 
speed = 700, 
$wall = $('#portfolio').find('.portfolio-container ul');
$wall.masonry({
singleMode: true,
itemSelector: '.one-half:not(.invis)',
animate: true,
animationOptions: {
duration: speed,
queue: false
}
});
$('#filterable a').click(function(){
var colorClass = '.' + $(this).attr('class');
if(colorClass=='.all') {
$wall.children('.invis')
.toggleClass('invis').fadeIn(speed);
} else { 
$wall.children().not(colorClass).not('.invis')
.toggleClass('invis').fadeOut(speed);
$wall.children(colorClass+'.invis')
.toggleClass('invis').fadeIn(speed);
}
$wall.masonry();
 return false;
});
});
});

jQuery.noConflict()(function($){
jQuery(document).ready(function($){
var 
speed = 700, 
$wall = $('#portfolio').find('.portfolio-container ul');
$wall.masonry({
singleMode: true,
itemSelector: '.one-fifth:not(.invis)',
animate: true,
animationOptions: {
duration: speed,
queue: false
}
});
$('#filterable a').click(function(){
var colorClass = '.' + $(this).attr('class');
if(colorClass=='.all') {
$wall.children('.invis')
.toggleClass('invis').fadeIn(speed);
} else { 
$wall.children().not(colorClass).not('.invis')
.toggleClass('invis').fadeOut(speed);
$wall.children(colorClass+'.invis')
.toggleClass('invis').fadeIn(speed);
}
$wall.masonry();
 return false;
});
});
});