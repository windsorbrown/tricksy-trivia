class Game < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :players
  has_many :users, through: :players
  has_many :user_answers
  has_many :game_questions
  has_many :questions, through: :game_questions

  enum status: [:pending, :active, :finished]

  after_update :notify_channels, if: :status_changed?
  after_create :notify_channels
  after_update :start_game, if: [:status_changed?, :active?]

  after_update :calculate_winner, if: [:status_changed?, :finished?]

  def next_question
    game_questions.find_by(status: 'pending')
  end

  def active_question
    game_questions.find_by(status: 'active')
  end

  def start_game
    NextQuestionJob.set(wait: 2.seconds).perform_later(self)
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
    when :finished
      ActionCable.server.broadcast "game_#{id}", event_type: :game_over
    end
  end

  def calculate_winner
    winner_id = ActiveRecord::Base.connection.execute("
                    SELECT players.id AS player_id, SUM(user_answers.score) AS score FROM players
                    JOIN user_answers
                      ON players.user_id = user_answers.user_id
                    JOIN games
                      ON games.id = players.game_id
                    GROUP BY players.id
                    ORDER BY score
                    LIMIT 1;
                   ").first['player_id']
    winner = Player.find(winner_id)
    winner.update(winner: true)
    debugger
    ActionCable.server.broadcast "overview_channel",
      game_score: {game: @game, winner: winner}
  end
end
