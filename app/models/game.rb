class Game < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :players
  has_many :users, through: :players
  has_many :user_answers
  has_and_belongs_to_many :questions

  enum status: [:pending, :active, :finished]

  after_update :notify_channels, if: :status_changed?
  after_create :notify_channels

  after_save do
    next unless status_changed?
    if active?
      StartGameJob.set(wait: 2.seconds).perform_later(self)
    elsif finished?
      puts "broadcasting"
      ActionCable.server.broadcast "game_#{id}", event_type: :game_over
    end
  end

  def winner
    return nil unless finished?
    players.find_by(winner: true)&.user
  end

  def notify_channels
    case status.to_sym
    when :pending
      ActionCable.server.broadcast "overview_channel",
        open_game: { game: self, owner: owner }
    when :active
      ActionCable.server.broadcast "room_#{id}",
        game_start: { game: self, status: status }
      ActionCable.server.broadcast "overview_channel",
        close_game: { game: self }
    end
  end
end
