class UserAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :game_question
  has_one :game, through: :game_question
  has_one :question, through: :game_question
  
  before_create do
    self.correct = (question.answer.downcase.tr(' ','') == answer.downcase.tr(' ',''))
  end

  after_save do
    unless answer.empty?
      notify_answer
    end
  end

  def notify_answer
      ActionCable.server.broadcast "game_#{game.id}",
        {event_type: :someone_answered, 
         data: {question_id: question_id, 
                user_name: user.name, 
                correct: correct}}
  end
end
