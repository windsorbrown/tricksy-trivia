class Creategamesquestions < ActiveRecord::Migration[5.0]
  def change
    create_table :games_questions do |t|
      t.references :game
      t.references :question
    end
  end
end
