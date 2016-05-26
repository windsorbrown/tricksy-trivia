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
        var user = data.added_user.id;
        playerList.append("<li id=\"user-" + user.id + "\"><img src=\"" + user.image + "\" class=\"img-circle\" alt=\"80\" height=\"50\" width=\"50\" /><span class=\"users-list-name\">" + user.name + "</span></li>");
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

