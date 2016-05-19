class CreateUserAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :user_answers do |t|
      t.references :user
      t.references :game
      t.references :question
      t.text :answer
      t.boolean :correct
    end
  end
end
