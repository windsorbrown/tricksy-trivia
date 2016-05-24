function beginGame(game_id) {
  App.cable.subscriptions.create({channel: "GameChannel", game_id: game_id }, {
    received: (message) => {
      $.each({ 
        someone_answered:      addAnsweringPlayerToList,
        time_up:       lockQuestion,
        next_question: showQuestion,
        game_over:     gameOver
      }, function (event_type, callback) {
        if (message.event_type === event_type) {
          callback(message.data);
        }
      });
    }
  });
}

function gameOver() {
  location += '/finish';
}
function addAnsweringPlayerToList(answer) {
  $('#answers').append($("<li>").text(answer.user_name));
}

function lockQuestion() {
}

function showQuestion(question) {
  $('#answers').empty();
  var tds = [].concat(
      ['category', 'question'].map((key) =>
        $("<td>").text(question[key])),
      ['answer', 'choice1', 'choice2', 'choice3'].map((key) =>
        $("<td>").append(choiceButton(question[key]))));

  $("#game-questions")
    .empty()
    .append(tds);
  
  function choiceButton(answerText) {
    return $("<button>")
      .click(function () {
        $("#game-questions button").attr('disabled', true);
        $.ajax({
          url: location + '/user_answers/',
          method: 'post',
          data: {
            answer: answerText,
            question_id: question.id
          },
          dataType: 'json',
          success: (res) => {
            if(res.correct){
              $(this).toggleClass('active-correct');
            } else if (res.correct === false) {
              $(this).toggleClass('active-wrong');
            }
          }
        });
      })
    .text(answerText);
  }
}
