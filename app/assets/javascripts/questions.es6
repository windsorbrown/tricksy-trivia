$(function(){
  if(window.location.pathname.indexOf("play_game") > -1){
    questionsGo();
  }});

function questionsGo() {
  $.ajax({
    method: 'get',
    url: 'play',
    dataType: 'json',
    success: askQuestions
  });

  function askQuestions(questions) {
    var questionTimeout = 0;
    var i = 0;
    nextQuestion();

    function choiceButton(answerText) {
      return $("<button>")
        .click(function () {
          var questionId = $('#game-questions').data('questionId');
          $.ajax({
            url: 'user_answers',
            method: 'post',
            data: {
              answer: answerText,
              question_id: questionId
            },
            dataType: 'json',
              success: (res) => {
                alert(res.correct ? "Correct!" : "Wrong!");
                nextQuestion();
              }
          });
        })
      .text(answerText);
    }

    function nextQuestion() {
      clearTimeout(questionTimeout);
      if (i == questions.length) {
        window.location.href = 'finish';
        $.ajax({
            url: 'finish',
            method: 'post'
        });
        alert("finished");
        return;
      }
      renderQuestion(questions[i++]);
      questionTimeout = setTimeout(nextQuestion, 2000);
    }

    function renderQuestion(question) {
      var tds = [].concat(
        ['category', 'question'].map((key) =>
          $("<td>").text(question[key])),
        ['answer', 'choice1', 'choice2', 'choice3'].map((key) =>
            $("<td>").append(choiceButton(question[key]))));

      $("#game-questions")
        .data('questionId', question.id)
        .empty()
        .append(tds);
    }
  }
}
