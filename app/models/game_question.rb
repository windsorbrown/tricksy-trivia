class GameQuestion < ApplicationRecord
  belongs_to :game
  belongs_to :question
  has_many :user_answers

  after_save :notify_start, if: [:status_changed?, :active?]
  after_save :notify_end, if: [:status_changed?, :finished?]
  enum status: [:pending, :active, :finished]
  
  def advance_now
    NextQuestionJob.perform_now(game, self)
  end
  private

  def notify_end
    ActionCable.server.broadcast "game_#{game.id}",
      { event_type: :time_up }
  end

  def notify_start
    ActionCable.server.broadcast "game_#{game.id}",
      { event_type: :next_question, data: question.as_json }

    # this is where the question time is set
    NextQuestionJob.set(wait: 10.seconds).perform_later(game, self)
  end
end
