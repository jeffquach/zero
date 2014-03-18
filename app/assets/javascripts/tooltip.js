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