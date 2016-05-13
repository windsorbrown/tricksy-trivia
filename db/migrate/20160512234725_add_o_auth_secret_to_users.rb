class AddOAuthSecretToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :oauth_secret, :string
  end
end
