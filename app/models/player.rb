class Player < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates_uniqueness_of :user, scope: :game

  after_create do
    ActionCable.server.broadcast "room_#{game.id}",
      added_user: {name: user.name, id: user.id}
  end

  before_destroy do
    ActionCable.server.broadcast "room_#{game.id}",
      removed_user: { name: user.name, id: user.id }
  end
end
