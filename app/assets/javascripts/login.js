$(document).ready(function(){
	$(".login-window").on("click",function(){
		$("body").css({"background-color":"black","z-index":"2333"})
		.click(function(){
			$("body").removeAttr("style");
			$(".login-popup").fadeOut(300);
		}); 
		var loginBox = $(this).attr('href');
		$(loginBox).fadeIn(300);

		var popupMarginTop = ($(loginBox).height() + 24)/2;
		var popupMarginLeft = ($(loginBox).width() + 24)/2;

		$(loginBox).css({'margin-top':-popupMarginTop,'margin-left':-popupMarginLeft});

		$("body").append('<div id="mask-thing"></div>');

		return false;

	});
	$(".close, #mask-thing").on("click", function(){
		$("#mask-thing, .login-popup").fadeOut(300, function(){
			$("#mask-thing").remove();
		});
		return false;
	});
});


