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
  location.reload();
}
function addAnsweringPlayerToList(answer) {
  $('#answers').append($("<li>").text(answer.user_name));
}

function lockQuestion() {
}

function showQuestion(question) {
  console.log('showing a new question');
  console.log(question.question);

  var category = question.category;
  var questionText = question.question;
  var answerKeys = ['answer', 'choice1', 'choice2', 'choice3'];
  for (var i = 1; i <= 4; i++) {
    var $answerDiv = $('#answer-'+i);
    var answerText = question[answerKeys[i-1]];
    $answerDiv.unbind('click')
      .one('click', function () {
        $.ajax({
          url: location + '/user_answers/',
          method: 'POST',
          data: {
            answer: answerText,
            question_id: question.id
          },
          dataType: 'json',
          success: function(res) {
            if(res.correct){
              $(this).toggleClass('active-correct');
            } else if (res.correct === false) {
              $(this).toggleClass('active-wrong');
            }
          }
        });
      })
    .find('.answer-text').text(answerText);
  }

  $('#question-category').text(category);
  $('#question-text').text(questionText);
  
  function choiceButton(answerText) {
    return $("<button>")
      .click(function () {
        $("#game-questions button").attr('disabled', true);
      })
    .text(answerText);
  }
}
