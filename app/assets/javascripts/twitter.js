$(function(){
  $("#twitter-connect").on('click', function(event){
      console.log("twitter")
    
    event.preventDefault();
     $.ajax({
       url: 'auth/twitter',
       dataType: 'json',
        success: function(response){
         console.log(response);
       }

     });
  });
});