class User < ApplicationRecord
  
  def self.create_with_omniauth(auth)
    user = User.find_by(uid: auth['uid'], provider:  auth['provider'])
    if User.exists?(user)
      user  
    else
      user = User.create(uid: auth['uid'], 
            provider:  auth['provider'], name: auth['info']['name'],
            image: auth['info']['image'], oauth_token: auth['credentials']['token'], 
            oauth_expires_at: Time.at(auth['credentials']['expires_at']))
      user.save
      user
    end
  end

end
