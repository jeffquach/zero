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
});

