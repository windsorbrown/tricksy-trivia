// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function(){
  $("#facebook-login").on('click', function(event){
    // this debugger should be hit when you click the submit button!
      console.log("facebook")
    
    event.preventDefault();
    
    //debugger;

    //var action = "//connect.facebook.net/en_US/all.js";
   //  var method = $(this).attr('method');
   //  // var description = $(this).find('#todo_description').val();
   //  // var priority = $(this).find('#todo_priority').val();

    // var data = $(this).serializeArray();
   //  var p = $('<p>');

     $.ajax({
    //   method: method,
      url: action,
      //data: data,
      dataType: 'json',

       success: function(response){
        console.log(response);
   // //     p.append(response["description"]);
   //       // $("#jj").html(response);
   console.log(response);
       }


     });


   // debugger;tex
 

  });
});