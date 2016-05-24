class UserAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :game_question
  has_one :game, through: :game_question
  has_one :question, through: :game_question
  
  scope :created_between, lambda {|start_date, end_date| where("created_at >= ? AND created_at <= ?", start_date, end_date )}

  before_create do
    self.correct = (question.answer.downcase.tr(' ','') == answer.downcase.tr(' ',''))
  end

  after_save do
    unless answer.empty?
      notify_answer
    end
  end

  def notify_answer
    ActionCable.server.broadcast "overview_channel",
      update_scores: { user: user, new_score: score }
    ActionCable.server.broadcast "game_#{game.id}",
      {event_type: :someone_answered, 
       data: {question_id: question.id, 
              user_name: user.name, 
              correct: correct}}
  end
end
