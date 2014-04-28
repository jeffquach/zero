$(document).ready(function(){
	$("#search-button, .user-preferences").click(function(){
		$("#search-form, #meetup-info").slideToggle();
	})

	$("#subject_search").change(function(){
		$.ajax({
			url: "/searches/update_topics",
			data: {subject_id: $("#subject_search").val()},
			dataType: "script"
		});
	});
})