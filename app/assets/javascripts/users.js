// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {
    $("#game-form").submit(function(e) {
        e.preventDefault();
        var game_number = $(this).find('input[name="game_number"]').val();
        window.location.href = "/games/" + game_number;
    });
});

function updateBoard() {
  var $scoreboard = $('#scoreboard'),
    $userli = $scoreboard.children('li');

  $userli.sort(function(a,b){
    var an = a.getAttribute('data-score-field'),
      bn = b.getAttribute('data-score-field');

    if(parseInt(an) > parseInt(bn)) {
      return -1;
    }
    if(parseInt(an) < parseInt(bn)) {
      return 1;
    }
    return 0;
  });

  $userli.detach().appendTo($scoreboard);
};