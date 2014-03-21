$(document).ready(function(){
  $("#new_user_friendship").on("submit", function(event){
    event.preventDefault();
    var friendId = $("#user_friendship_friend_id").val();
    var _this = $(this);

    $.ajax({
      url: "/user_friendships",
      method: "POST",
      dataType: "json",
      data: _this.serialize(),
      success: function(data){
        console.log(data);
        _this.hide();
        $(".friend-request-form").html("<p>Friend request sent</p>");
      }
    });
  });
});

// $(document).ready(function(){
// 	$("#new_user_friendship").on("ajax:success", function(event, data){
// 		console.log(data);
// 		$(".friend-request-form").html("<p>Friend request sent</p>")
// 	})
// })


// $(document).ready(function(){

//   $("#add-friend").on("ajax:success", function(event, data){
//     console.log("here");
//     console.log(data);
//     $(".friend-status").html("<p>Friend Request Sent</p>");
//   });

// });