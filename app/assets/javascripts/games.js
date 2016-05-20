// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function getPlayers() {
<<<<<<< HEAD

  $.ajax({
    method: 'get',
    url: window.location.pathname + '/players', // <-- get '/games/:game_number/players'
    dataType: 'json',
    success: function(response) {
      $("#player-list").empty();
      response.forEach(function(player) {
          var tr = $("<tr>");
          tr.append("<td>" + player.name + "</td>");
          $("#player-list").append(tr);
          console.log(response);
          setTimeout(getPlayers, 10000);
      });
    }
  });
=======
  setTimeout(function() {
    $.ajax({
      method: 'get',
      url: window.location.pathname + '/players',
      dataType: 'json',
      success: function(response) {
        $("#player-list").empty();
          response.forEach(function(player) {
            var tr = $("<tr>");
            tr.append("<td>" + player.name + "</td>");
            $("#player-list").append(tr);
            console.log(response);
          });
      },complete: getPlayers});
  }, 500);
>>>>>>> 7d8b9bc9ec82544a9e9ae106caecb7e2a0113b43
}




$(function(){
//  getPlayers();
});
