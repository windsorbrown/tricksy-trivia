$(function(){
     $("#join_game").on('click', function(){
       console.log("join");
       $.ajax({
         type: 'get',
         url: window.location.pathname + '/edit', // <-- get '/games/:game_number/players'
         success: function(response) {
           $("#join_game").hide();
           $("#leave_game").show();
         }
       });
     });
     $("#leave_game").on('click', function(){
       console.log("leave");
       $.ajax({
         type: 'post',
         data: { _method: 'PATCH'},
         url: window.location.pathname, // <-- get '/games/:game_number/players'
         success: function(response) {
           $("#leave_game").hide();
           $("#join_game").show();
         }
       });
     });

});
