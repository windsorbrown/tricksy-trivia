class AddStartTimeToGameQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :game_questions, :start_time, :datetime
  end
end
