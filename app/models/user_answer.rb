class UserAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :game
  belongs_to :question

  before_create do
    self.correct = (question.answer.downcase.tr(' ','') == answer.downcase.tr(' ',''))
  end

  after_create do
    ActionCable.server.broadcast "game_#{@answer.game.id}",
      {event_type: "newQuestion", question: @answer.question_id, user: user, correct: @answer.correct}
  end
end
