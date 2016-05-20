$(function() {
  $.ajax({
    method: 'get',
    url: 'play',
    dataType: 'json',
    success: askQuestions
  });

  function askQuestions(questions) {
    let questionTimeout = null;
    let i = 0;
    nextQuestion();
    function choiceButton(answerText) {
      return $("<button>")
        .click(function () {
          let questionId = $('#game-questions').data('questionId');
          $.ajax({
            url: 'user_answers',
            method: 'post',
            dataType: 'json',
            data: {
              answer: answerText,
              question_id: questionId
            },
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
        alert("finished");
        return;
      }
      renderQuestion(questions[i++]);
      questionTimeout = setTimeout(nextQuestion, 2000);
    }

    function renderQuestion(question) {
      let tds = [].concat(
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
});
