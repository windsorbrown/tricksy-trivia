class Player < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates_uniqueness_of :user, scope: :game

  after_create do
    ActionCable.server.broadcast "room_#{game.id}",
      added_user: { name: user.name, id: user.id }
  end

  def score
    x = Player.joins(:user).joins("JOIN user_answers ON users.id = user_answers.user_id")
    .where(game_id: game.id).sum('user_answers.score')
  end
  before_destroy do
    ActionCable.server.broadcast "room_#{game.id}",
      removed_user: { name: user.name, id: user.id }
  end
end
