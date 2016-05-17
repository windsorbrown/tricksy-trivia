class Game
  def self.start(*user)

    user.each do |user|
      ActionCable.server.broadcast "player_#{user.id}", {action: "game_start", msg: "#{user.name}"}  
      unless user.id == self.id 
        REDIS.set("opponent:#{user.id}")
      end
    end

  end

end

    
