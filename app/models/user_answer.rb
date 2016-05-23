class UserAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :game
  belongs_to :question

  scope :created_between, lambda {|start_date, end_date| where("created_at >= ? AND created_at <= ?", start_date, end_date )}

  before_create do
    self.correct = (question.answer.downcase.tr(' ','') == answer.downcase.tr(' ',''))
  end

end
