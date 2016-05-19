// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function getQuestions() {

  var url = window.location.pathname;
  var urlsplit = url.split("/").slice(-1)[0];

   $.ajax({
      method: 'get',
       url: window.location.pathname + '/play', // <-- get '/games/:game_number/players'
       dataType: 'json',
       success: function(response) {
  //     // window.players = response.user_id;
  //     // $newPlayer = $("<ul />");
    //   $("#player-list").empty();
      // response.forEach(function(player) {
  //       // $newPlayer.append(
           var tr = $("<tr>");
           tr.append("<td>" + response.category + "</td>");
           
           tr.append("<td>" + response.question + "</td>");

           tr.append("<td>" + response.choice1 + "</td>");

           tr.append("<td>" + response.answer + "</td>");

           tr.append("<td>" + response.choice3 + "</td>");

           tr.append("<td>" + response.choice2 + "</td>");


           $("#game_questions").append(tr);
            console.log(response);
  //         setTimeout(getPlayers, 10000);
  //     //   );
  //     // $("#player").html($newPlayer.html());
  //     });
      }
     });
}





 $(function(){
   getQuestions();
 });
