(function(){

	$(document).ready(function(){
		// $('.show-bio').show();
		// $('.hidden-bio').hide();
		// $('.show-bio').click(function(){
		// 	$('.hidden-bio').slideToggle(1);
		// });
		runBootstrapTooltip();
	});

	function runTooltip(){
		$(document).tooltip({
			items: '.show-bio',
			position: { my: "left+15 top", at: "right center" },
			content: function(callback){
				var user_id = $("#hidden-id").attr("value");
				$.ajax({
					url: "/users/" + user_id + "/tooltip",
					method: 'GET',
					dataType: 'html',
					success: function(data){
						callback(data);
					}
				});
			}
		});
	}

	function runBootstrapTooltip(){
		$(".show-bio").mouseover(function(event){
			event.preventDefault();
			var user_id = $("#hidden-id").attr("value");
			var self = $(this);

			$.ajax({
				url: "/users/" + user_id + "/tooltip",
				method: 'GET',
				dataType: 'html',
				success: function(data){
					console.log(data);
					self.tooltip({
						title: data,
						trigger: "hover focus active"
					});
				}
			});
		});
	}
}());




