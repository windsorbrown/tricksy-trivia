class AddMultipleChoicetoQuestions < ActiveRecord::Migration[5.0]
  def change
     change_table :questions do |t|
      t.string :choice1
      t.string :choice2
      t.string :choice3
    end
  end
end
