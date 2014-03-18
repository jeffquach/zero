$(document).ready(function(){
	$(".login-window").click(function(){
		var loginBox = $(this).attr('href');
		$(loginBox).fadeIn(300);

		var popupMarginTop = ($(loginBox).height() + 24)/2;
		var popupMarginLeft = ($(loginBox).width() + 24)/2;

		$(loginBox).css({'margin-top':-popupMarginTop,'margin-left':-popupMarginLeft});

		$('body').append('<div id="mask"></div>');
		$("#mask").fadeIn(300); 

		return false;

	});
	$(".close, #mask").on("click", function(){
		$("#mask, .login-popup").fadeOut(300, function(){
			$("#mask").remove();
		});
		return false;
	});
});


