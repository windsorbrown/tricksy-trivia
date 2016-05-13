class User < ApplicationRecord
  
  def self.create_with_omniauth(auth)
    user = User.find_by(uid: auth['uid'], provider:  auth['provider'])
    if User.exists?(user)
      user  
    else
      user = User.create(uid: auth['uid'], 
            provider:  auth['provider'], name: auth['info']['name'],
            image: auth['info']['image'], oauth_token: auth['credentials']['token'], 
             oauth_secret: auth['credentials']['secret'])
      user.save
      user
    end
  end

  def tweet(tweet)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets.twitter_app_id
      config.consumer_secret     = Rails.application.secrets.twitter_app_secret
      config.access_token        = oauth_token
      config.access_token_secret = oauth_secret
    end
    
    client.update(tweet)
  end

  def invite_friends
    if provider == "facebook"
      link = "signed in with facebook" #https://www.facebook.com/dialog/send?app_id=12345%20&link=http://www.domains.com&redirect_uri=http://localhost:3000"
    elsif provider == "twitter"
     link = "signed in with twitter"  #can easily call the tweet method on current_user to post a new tweet
    end
    link
  end

end
