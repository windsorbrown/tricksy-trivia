class ChangeGamesQuestionsToGameQuestions < ActiveRecord::Migration[5.0]
  def change
    rename_table :games_questions, :game_questions
    add_column :game_questions, :status, :integer

    remove_column :user_answers, :game_id, :integer
    remove_column :user_answers, :question_id, :integer
    add_reference :user_answers, :game_question
  end
end
