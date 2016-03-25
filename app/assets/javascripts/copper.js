// JavaScript Document

$(document).on("page:change", function() {

	$('#xtrigger img').click(function() {
	
		//event.preventDefault();
		//alert ("trig");

		$("#art-index").slideUp('fast');
		$("#art-gallery").slideDown('slow');
		//location.reload();
		
	});	

	$('#allartwork_link').click(function () {
		if ($('#art-gallery').is(':visible')){
			$("#art-gallery").slideUp("fast");
			$('#art-index').slideDown("slow");
		}
		else{
			$("#art-index").slideUp("slow");
			$("#art-gallery").slideDown("slow");
		}
	});

	$('#slider-close').click(function () {
		$('#art-gallery').slideUp('slow');
		$('#art-index').slideDown('slow');
		$('#slideShow').show();
		$('#slideShowStop').hide();		
		stopSlider();		
	});

	$('#close').click(function () {
		$("#art-index").slideUp('fast');
		$("#art-gallery").slideDown('slow');

		//alert ("close");
		
	});




	
	$('#jointhemailinglist').click(function () {
		if ($("#about").is(":visible")) {
			$("#join").slideDown(0);
			$("#about").hide();
		}
		else
			if ($("#join:first").is(":hidden")) {
				$("#join").slideDown("slow");
				$("#art-index").slideUp("fast");
				$("#art-gallery").slideUp("fast");
				$('#bottomArt').show('slow');
			} else {
				$("#join").slideUp("fast");
				$("#art-index").slideDown("slow");
				$('#bottomArt').hide('fast');
			}	
		});

	$('#aboutpull').click(function () {
		if ($("#join").is(":visible")) {
			$("#about").slideDown(0);
			$("#join").hide();
			
		}else
		if ($("#about:first").is(":hidden")) {
			$("#about").slideDown("slow");
			$("#art-index").slideUp("fast");
			$("#art-gallery").slideUp("fast");
			$('#bottomArt').show('slow');
		} else {
			$("#about").slideUp("fast");
			$("#art-index").slideDown("slow");
			$('#bottomArt').hide('fast');
		}
		});

	$('#aboutclose').click(function () {
		if ($('#art-gallery').is(':visible')){
			$("#about").slideUp("fast");
			$('#bottomArt').hide('fast');
		}
			else{
				$("#about").slideUp("fast");
				$("#art-index").slideDown("slow");
				$('#bottomArt').hide('fast');
			}
		});
	$('#joinclose').click(function () {
		if ($('#art-gallery').is(':visible')){
			$("#join").slideUp("fast");
			$('#bottomArt').hide('fast');
		}
			else{
				$("#join").slideUp("fast");
				$("#art-index").slideDown("slow");
				$('#bottomArt').hide('fast');
			}
		});







	//HC Slider

	//$("#slider .slides").animate({"margin-left": -1170}, 10000);
	//$("#slider .slides").animate({"margin-left": '-=1170'}, 10000);

	//count paintings
	var slideCount = $(".slides > .slide").length;
	//width of all paintings
    var width = 1170;
    
    //pause slides
    var pause = 3000;
    //animation speed
    var animationSpeed = 1000;
    var currentSlide = 1;

    var $slider = $("#slider");
    var $sliderContainer = $slider.find(".slides");
    var $slides = $slider.find(".slide");

    var slideLength = slideCount * width;
	$sliderContainer.css("width", slideLength); 

	var interval;

	function startSlider(){
		interval = setInterval(function() {
			$sliderContainer.animate({"margin-left": "-="+width}, animationSpeed, function(){
				currentSlide++;
				if(currentSlide === $slides.length + 1) {
					currentSlide = 1;
					$sliderContainer.css("margin-left", 0);
				};
			});	
		}, pause);
	}
	
	function stopSlider(){
		clearInterval(interval);
	}	

	$('#slideFront').click(function (event) {
		event.preventDefault();
		$('#slideShow').show();
		$('#slideShowStop').hide();		
		stopSlider();
		$sliderContainer.animate({"margin-left": "-="+width}, animationSpeed, function(){
			currentSlide++;
			//$('#slideBack').show();
			console.log(currentSlide);
			if(currentSlide === $slides.length + 1) {
				currentSlide = 1;
				$sliderContainer.css("margin-left", 0);
			};

		});		
	});	

	$('#slideBack').click(function (event) {
		event.preventDefault();
		$('#slideShow').show();
		$('#slideShowStop').hide();		
		stopSlider();
		$sliderContainer.animate({"margin-left": "+="+width}, animationSpeed, function(){
			currentSlide--;
			console.log(currentSlide);
			//$('#slideBack').show();
			if(currentSlide === 0) {
				currentSlide = $slides.length;
				$sliderContainer.css("margin-left", -slideLength+width);
				console.log("newSlide:" + currentSlide);
			};
		});		
	});		


	$('#slideShow').click(function (event) {
		event.preventDefault();
		$('#slideShow').hide();
		$('#slideShowStop').show();
		startSlider();
	});	

	$('#slideShowStop').click(function (event) {
		event.preventDefault();
		$('#slideShow').show();
		$('#slideShowStop').hide();
		stopSlider();
	});	




	//$slider.on('mouseenter', stopSlider).on('mouseleave', startSlider);

	//startSlider();




});