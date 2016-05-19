class Game < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :players
  has_many :users, through: :players
  has_many :user_answers
  has_and_belongs_to_many :questions

  enum status: [:pending, :active, :finished]

  def add_player(user)
    players << Player.new(user: user, game: self)
  end
end

