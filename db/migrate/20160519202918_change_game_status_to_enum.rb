class ChangeGameStatusToEnum < ActiveRecord::Migration[5.0]
  def change
    change_table :games do |t|
      t.remove :started
      t.remove :finished
      t.integer :status, default: 0
    end
  end
end
