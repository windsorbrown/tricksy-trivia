class AddScoresToUserAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :user_answers, :score, :integer
  end
end
