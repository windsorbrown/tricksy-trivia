class ChangeGameUserToOwner < ActiveRecord::Migration[5.0]
  def change
    change_table :games do |t|
      t.remove :user_id
      t.integer :owner_id
    end
  end
end
