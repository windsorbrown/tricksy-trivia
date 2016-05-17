// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function () {
  $('#answer').submit(function(e) {
    e.preventDefault();
    $form = $(this);
    let answer = $form.children('input[name="answer"]').first().val();
    let question_id = $('#question').data('question-id');
    $.ajax({
      method: 'PUT',
      url: '/answer/' + question_id, 
      data: {"answer": answer},
      dataType: 'json',
      success: function(response) {
        let result = response.correct? "Right!" : "Wrong!";
        $form.replaceWith($('<h1>').text(result));
      }
    });
  });
});
