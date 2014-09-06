$(document).ready(function() {
	
	$('.dishes').hide()	

	$('.button').on('click', function() {

	$(this).next().toggle();
	});
});

	
