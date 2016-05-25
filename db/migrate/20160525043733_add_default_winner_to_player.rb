class AddDefaultWinnerToPlayer < ActiveRecord::Migration[5.0]
  def change
    change_column :players, :winner, :boolean, default: false
  end
end
