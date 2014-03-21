$(document).ready(function(){
  $(".friend-request-form").on("click", function(event){
    event.preventDefault();
    var friendId = $("#user_friendship_friend_id").val();
    var friendButton = $(this);

    $.ajax({
      url: "/user_friendships",
      method: "POST",
      dataType: "json",
      success: function(data){
        console.log(data);
        friendButton.hide();
        $(".friend-request-form").html("<p>Friend request sent</p>");
      }
    });
  });
});