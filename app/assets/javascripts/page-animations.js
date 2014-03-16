(function(){
	$(document).ready(function(){
		$('.show-bio').show();
		$('.hidden-bio').hide();
		$('.show-bio').click(function(){
			$('.hidden-bio').slideToggle(1);
		});
		// $('.hidden-bio').hide();
		// $('.show-bio').mouseenter(function(){
		// 	$('.hidden-bio').show();
		// }).mouseleave(function(){
		// 	$('.hidden-bio').hide();
		// });

	});
}());


