$(document).ready(function(){
	$("#new_topic").submit(function(e){
		e.preventDefault();
		var _this = $(this);

		$.ajax({
			url: "/topics",
			method: "POST",
			dataType: "script",
			data: _this.serialize(),
			success: function(data){
				console.log(data);
				(_this[0]).reset();
			}
		});
	});

	$(".delete-topic").on("click",function(e){
		e.preventDefault();
		var _this = $(this);
		var topic_id = _this.attr('href');

		$.ajax({
			url: topic_id,
			data: {"_method":"delete"},
			method: "POST",
			dataType: "script",
			success: function(data){
				console.log(data);
				_this.remove();
			}
		});
	});
});


