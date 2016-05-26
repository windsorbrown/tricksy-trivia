'use strict';

$(function () {
  $("#join_game").on('click', function () {
    $.ajax({
      url: '/edit', // <-- get '/games/:game_number/players'
      success: function success(response) {
        $("#join_game").hide();
        $("#leave_game").show();
      }
    });
  });
  $("#leave_game").on('click', function () {
    $.ajax({
      type: 'post',
      data: { _method: 'PATCH' },
      success: function success(response) {
        $("#leave_game").hide();
        $("#join_game").show();
      }
    });
  });
});

function subscribeRoomChannel(game_id) {
  App.cable.subscriptions.create({ channel: "RoomChannel", game_id: game_id }, {
    received: function received(data) {
      var playerList = $('#player-list');
      if (data.added_user) {
        var user = data.added_user;
        playerList.append($('<li>').text(user.name).attr("id", 'user-' + user.id));
      } else if (data.removed_user) {
        var _user = data.removed_user;
        playerList.find('#user-' + _user.id).remove();
      } else if (data.game_start) {
        var game = data.game_start.game;
        location.reload();
      }
    }
  });
}

