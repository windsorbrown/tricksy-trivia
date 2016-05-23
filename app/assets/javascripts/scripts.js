/* Custom Scripts */
$(document).ready(function () {
		
	// Start Main Content Slider
	$('#main-slider').flexslider({
		animation: "fade",
  	slideshowSpeed: 3000,
    pauseOnHover: false, 
		useCSS: false,
		controlNav: true,               //Boolean: Create navigation for paging control of each clide? Note: Leave true for manualControls usage
		touch: true,
		prevText: "<span class='fa fa-angle-left'></span>",
		nextText: "<span class='fa fa-angle-right'></span>",
	});
		
	// Start Logo Slider
      $('#logo').flexslider({
        animation: "slide",
		touch: true,
		initDelay: 1000,                   //{NEW} Integer: Set an initialization delay, in milliseconds
		controlNav: false,               //Boolean: Create navigation for paging control of each clide? Note: Leave true for manualControls usage
		prevText: "<span class='fa fa-angle-left'></span>",
		nextText: "<span class='fa fa-angle-right'></span>",
		itemWidth: 190,
		itemMargin: 30,
		minItems: 1,
		maxItems: 5,
		move: 1,
      });

	// Start Header Animation
	$(window).scroll(function () {
	if ($(document).scrollTop() < 1) {
	$('header').removeClass('fix');
	} else {
	$('header').addClass('fix');
	}
	});

	
	
});	