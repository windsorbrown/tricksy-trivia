// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function getQuestions() {
  var i = 0;
  var question_array =[];
  var urlreal = window.location.pathname;
  var urlsplit = urlreal.split("/").slice(-1)[0];
  var res = urlreal.replace(urlsplit, "");
  var makeurl = window.location.origin + res + 'play';
  console.log(makeurl);
   $.ajax({
      method: 'get',
       url: makeurl,
       dataType: 'json',
       success: function(response) {         
         response.forEach(function(question) {
          setTimeout(function(){ showQuestion(question); }, i*2000);
          i+=1; 
        });       
     }
  });
}

function showQuestion(question){
  let choiceButton = function(answerText) {
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
          success: (res) => { alert(res.correct ? "Correct!" : "Wrong!"); }
        });
      })
    .text(answerText);
  };

  let tr = $("<tr>");
   tr.append([
     $("<td>").text(question.category),
     $("<td>").text(question.question),
     $("<td>").append(choiceButton(question.choice1)),
     $("<td>").append(choiceButton(question.answer)),
     $("<td>").append(choiceButton(question.choice2)),
     $("<td>").append(choiceButton(question.choice3))
   ]);
   $("#game-questions")
     .empty()
     .append(tr)
     .data('questionId', question.id);
}


 $(function(){
   getQuestions();
 });
