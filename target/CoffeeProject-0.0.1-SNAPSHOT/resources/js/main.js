(function($) {
	"use strict";

	// Spinner
	var spinner = function() {
		setTimeout(function() {
			if ($('#spinner').length > 0) {
				$('#spinner').removeClass('show');
			}
		}, 1);
	};
	spinner();


	// Initiate the wowjs
	new WOW().init();


	// Sticky Navbar
	$(window).scroll(function() {
		if ($(this).scrollTop() > 300) {
			$('.sticky-top').addClass('shadow-sm').css('top', '0px');
		} else {
			$('.sticky-top').removeClass('shadow-sm').css('top', '-100px');
		}
	});


	// Back to top button
	$(window).scroll(function() {
		if ($(this).scrollTop() > 300) {
			$('.back-to-top').fadeIn('slow');
		} else {
			$('.back-to-top').fadeOut('slow');
		}
	});
	$('.back-to-top').click(function() {
		$('html, body').animate({ scrollTop: 0 }, 1500, 'easeInOutExpo');
		return false;
	});


	// Facts counter
	$('[data-toggle="counter-up"]').counterUp({
		delay: 10,
		time: 1000
	});


	// Header carousel
	$(".header-carousel").owlCarousel({
		autoplay: true,
		smartSpeed: 1500,
		items: 1,
		dots: true,
		loop: true,
		nav: true,
		navText: [
			'<i class="bi bi-chevron-left"></i>',
			'<i class="bi bi-chevron-right"></i>'
		]
	});

	//중앙베너
	$(".story-carousel").owlCarousel({
		autoplay: true,
		smartSpeed: 1500,
		items: 1,
		dots: true,
		loop: true,
		nav: true,
		navText: [
			'<i class="bi bi-chevron-left"></i>',
			'<i class="bi bi-chevron-right"></i>'
		]
	});


	// Testimonials carousel
	$(".testimonial-carousel").owlCarousel({
		autoplay: true,
		smartSpeed: 1000,
		center: true,
		dots: false,
		loop: true,
		nav: true,
		navText: [
			'<i class="bi bi-arrow-left"></i>',
			'<i class="bi bi-arrow-right"></i>'
		],
		responsive: {
			0: {
				items: 1
			},
			768: {
				items: 2
			}
		}
	});

	//상단검색 - 태그
	var $projectsList = $('.projects-list');
	var $projects = $projectsList.find('.project');
	var $projectsTags = $('.projects-tags');
	var tagsObj = {};
	var fadeSpeed = 500;

	$projects.each(function() {
		var project = this;
		var $project = $(this);
		var $tagsList = $project.find('.tags');
		var tags = $project.data('tags').split(',');
		tags.forEach(function(tag) {
			var li = '<li class="tag">';
			li += tag;
			li += '</li>';
			$tagsList.append($(li));//same li or $(li)?

			if (!tagsObj.hasOwnProperty(tag))
				tagsObj[tag] = [];
			tagsObj[tag].push(project);
		});
	});

	//console.log(tagsObj);
	$.each(tagsObj, function(tag) {
		var $button = $('<button>' + tag + '</button>');
		$button.on('click', function() {
			if ($projects.is(':animated'))
				return false;
			$(this).addClass('active').siblings().removeClass('active');
			$projects.filter(':visible').fadeOut(fadeSpeed, function() {
				$projects.filter(tagsObj[tag]).fadeIn(fadeSpeed);
			});
		}).appendTo($projectsTags);
	});


	// Portfolio isotope and filter
	var portfolioIsotope = $('.portfolio-container').isotope({
		itemSelector: '.portfolio-item',
		layoutMode: 'fitRows'
	});
	$('#portfolio-flters li').on('click', function() {
		$("#portfolio-flters li").removeClass('active');
		$(this).addClass('active');

		portfolioIsotope.isotope({ filter: $(this).data('filter') });
	});

})(jQuery);

