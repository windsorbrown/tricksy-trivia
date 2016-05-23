

$(function(){
  if(window.location.pathname.indexOf("play_game") > -1){
     
    questionsGo();
  }});

function questionsGo() {
  var the_url = window.location.pathname.match(/\d{9}/g);
  var g_id = the_url[0];
  App.cable.subscriptions.create({channel: "GameChannel", game_id: g_id }, {
    received: (data) => {
      var answers = $('#answers');
      answers.append($("<li>").text(data.question.user.name));
        // console.log(data.question);
    }
  });

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
             
               // add scores here. 
              //  alert(res.correct ? "Correct!" : "Wrong!");
              //  nextQuestion();
              }
          });
        })
      .text(answerText);
    }

    function nextQuestion() {
      $('#answers').empty();
      clearTimeout(questionTimeout);
      if (i == questions.length) {
        window.location.href = 'finish';
        $.ajax({
            url: 'finish',
            method: 'post'
        });
   //     alert("finished");
        return;
      }
      renderQuestion(questions[i++]);
      questionTimeout = setTimeout(nextQuestion, 20000); //change this to 10 secs after testing
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
