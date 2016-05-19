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
          setTimeout(function(){ showQuestion(question)}, i*10000);
          i+=1; 
        });       
     }
  });

}




function showQuestion(question){
  console.log("test");
  var tr = $("<tr>");
   $("#game_questions").empty(); 
   tr.append("<td>" + question.category + "</td>");
   tr.append("<td>" + question.question + "</td>");
   tr.append("<td>" + question.choice1 + "</td>");
   tr.append("<td>" + question.answer + "</td>");
   tr.append("<td>" + question.choice3 + "</td>");
   tr.append("<td>" + question.choice2 + "</td>");
   $("#game_questions").append(tr);
}


 $(function(){
   getQuestions();
 });
