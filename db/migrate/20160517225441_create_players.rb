class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    rename_table :games_users, :players
  end
end
