class AddWinnerToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :winner, :boolean
  end
end
