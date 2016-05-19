// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function getPlayers() {

  $.ajax({
    method: 'get',
    url: window.location.pathname + '/players', // <-- get '/games/:game_number/players'
    dataType: 'json',
    success: function(response) {
      // window.players = response.user_id;
      // $newPlayer = $("<ul />");
      $("#player-list").empty();
      response.forEach(function(player) {
        // $newPlayer.append(
          var tr = $("<tr>");
          tr.append("<td>" + player.name + "</td>");
          $("#player-list").append(tr);
          // $("<li>").addClass("player list-group-item").text(player.user_id);
          console.log(response);
          setTimeout(getPlayers, 1000);
      //   );
      // $("#player").html($newPlayer.html());
      });
    }
  });
}

$(function(){
  getPlayers();
});
