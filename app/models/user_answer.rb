class UserAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :game
  belongs_to :question

  before_create do
    self.correct = (question.answer.downcase.tr(' ','') == answer.downcase.tr(' ',''))
  end

end
