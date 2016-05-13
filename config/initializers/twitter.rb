
# CLIENT = Twitter::REST::Client.new do |config|
#   config.consumer_key        = Rails.application.secrets.twitter_app_id
#   config.consumer_secret     = Rails.application.secrets.twitter_app_secret
#   # config.access_token        = current_user.oauth_token
#   # config.access_token_secret = current_user.oauth_secret
# end


# CLIENT = Twitter::REST::Client.new do |config| 
#   config.consumer_key = ENV['consumer_key'] 
#   config.consumer_secret = ENV['consumer_secret'] 
#   config.access_token = ENV['access_token'] 
#   config.access_token_secret = ENV['access_secret'] 
# end

#was trying to use twitter.rb for initialisers but i cant as i dont have access to the oauth.token till the user is authenticateed
#which means the best way is to do it in the user model. as per https://richonrails.com/articles/sending-a-tweet-to-twitter

