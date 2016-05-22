class PublicGames < ActiveRecord::Migration[5.0]
  def change
    change_table :games do |t|
      t.integer :keep_private, default: 0
    end
  end
end
