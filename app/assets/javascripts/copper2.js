// JavaScript Document

$().ready(function() {

	$('#coda-slider-1').codaSlider();
	
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

	$('#cartooncontest').click(function () {
		$("#cartoon_contest").slideToggle("slow", function(){
			$.scrollTo("max",300);
		});
			return false;

		});
});