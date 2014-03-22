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
        $(".friend-request-form").html('<button class="button radius tiny" disabled="disabled" name="button" type="submit" style="background-color:green;">Study partner request sent</button>');
      }
    });
  });

  // $(".edit_user_friendship").on("ajax:success", function(event, data){
  //   $tingzSon = $($(event.target).parent()[0])
  //   $tingzSon.remove();
  // });

  $(".edit_pending_user_friendship").on("submit", function(event){
    event.preventDefault();
    var _this = $(this);
    var friend = _this.attr('id');

    $.ajax({
      url: "/user_friendships/"+friend,
      data: {"_method":"delete"},
      method: "POST",
      dataType: "json",
      success: function(data){
        console.log(data);
        _this.closest(".pending").remove();
        if ($(".pending-study-partners").children().length === 0) {
          $(".pending-study-partners").html("<h4>You have no pending requests!</h4>")
        };
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