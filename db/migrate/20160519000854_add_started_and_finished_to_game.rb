class AddStartedAndFinishedToGame < ActiveRecord::Migration[5.0]
  def change
    change_table :games do |t|
      t.boolean :started, default: false
      t.boolean :finished, default: false
    end
  end
end
