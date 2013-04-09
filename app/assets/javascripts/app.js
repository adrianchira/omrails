$(function() {
	//code to show/hide scroll-to-top button
	$(window).on('scroll', function(){
		if( $(window).scrollTop()  < 600 ) {			
			$('#back_to_top img').addClass('no_display');
		} 
		else {
			$('#back_to_top img').removeClass('no_display');				
		}
	});

});