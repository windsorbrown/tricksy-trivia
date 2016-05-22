class AddTimestampsToUserAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column(:user_answers, :created_at, :datetime)
    add_column(:user_answers, :updated_at, :datetime)
  end
    
end

