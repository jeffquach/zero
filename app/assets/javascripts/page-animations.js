(function(){
	$(document).ready(function(){
		$('.show-bio').show();
		$('.hidden-bio').hide();
		$('.show-bio').click(function(){
			$('.hidden-bio').slideToggle(1);
		});
	});

}());


