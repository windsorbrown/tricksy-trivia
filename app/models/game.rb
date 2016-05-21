class Game < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :players
  has_many :users, through: :players
  has_many :user_answers
  has_and_belongs_to_many :questions


  enum status: [:pending, :active, :finished]

  scope :finished, -> { where(status: finished) }
  def add_player(user)
    if players.find_by(user_id: user.id)
      return false
     else  
      players << Player.new(user: user, game: self)
    end
  end

  def winner
    return nil unless finished?
    players.find_by(winner: true)&.user
  end

