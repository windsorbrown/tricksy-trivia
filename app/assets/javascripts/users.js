// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {
    $("#game-form").submit(function(e) {
        e.preventDefault();
        let game_number = $(this).find('input[name="game_number"]').val();
        window.location.href = "/games/" + game_number;
    });
});
