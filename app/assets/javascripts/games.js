$(function(){
     $("#join_game").on('click', function(){
       console.log("join");
       $.ajax({
         url: '/edit', // <-- get '/games/:game_number/players'
         success: function(response) {
           $("#join_game").hide();
           $("#leave_game").show();
         }
       });
     });
     $("#leave_game").on('click', function(){
       console.log("leave");
       $.ajax({
         type: 'post',
         data: { _method: 'PATCH'},
         success: function(response) {
           $("#leave_game").hide();
           $("#join_game").show();
         }
       });
     });
});

function subscribeRoomChannel(game_id) {
  App.cable.subscriptions.create({channel: "RoomChannel", game_id: game_id}, {
    received: (data) => {
      let playerList = $('#player-list');
      if (data.added_user) {
        let user = data.added_user;
        playerList.append($('<li>').text(user.name).attr("id", `user-${user.id}`));
      }
      else if (data.removed_user) {
        let user = data.removed_user;
        playerList.find(`#user-${user.id}`).remove();
      }
      else if (data.game_start){
        let game = data.game_start.game;
        location.reload();
      }
    }
  });
}
