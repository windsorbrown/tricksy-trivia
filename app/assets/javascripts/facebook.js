  window.fbAsyncInit = function() {
    // init the FB JS SDK
    FB.init({
        appId      : '859251704186405', // App ID from the App Dashboard
        status     : true, // check the login status upon init?
        cookie     : true, // set sessions cookies to allow your server to access the session?
        xfbml      : true  // parse XFBML tags on this page?
    });

    // Additional initialization code such as adding Event Listeners goes here

};

(function(d, debug){
    var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
    if (d.getElementById(id)) {return;}
    js = d.createElement('script'); js.id = id; js.async = true;
    js.src = "//connect.facebook.net/en_US/all" + (debug ? "/debug" : "") + ".js";
    ref.parentNode.insertBefore(js, ref);
}(document, /*debug*/ false));

$(function() {
    $('#facebook-connect').click(function(e) {
        e.preventDefault();

        FB.login(function(response) {
            if (response.authResponse) {
                // since we have cookies enabled, this request will allow omniauth to parse
                // out the auth code from the signed request in the fbsr_XXX cookie
                $.getJSON('auth/facebook/callback', function(data) {
                    // 'data' contains a 'user' object with 'email' and 'name' in it.
                   console.log(data);
                   $('#show-me').append(data["name"]).append(data["image"]);
                   
                });
            }
        }, {  });
    });
});
