class Player < ApplicationRecord
  belongs_to :user
  belongs_to :game

  # before_create :check_if_joined

  after_create do
    ActionCable.server.broadcast "room_#{game.id}",
      added_user: {name: user.name, id: user.id}
  end

  before_destroy do
    ActionCable.server.broadcast "room_#{game.id}",
      removed_user: { name: user.name, id: user.id }
  end

  # def check_if_joined
  #   if game.players.include?(user) then return false end
  # end

end
