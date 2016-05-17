class CreateGamesUsersJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table :games_users do |t|
      t.references :user
      t.references :game
    end
  end
end
