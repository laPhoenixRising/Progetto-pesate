class AddSecretToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :secret, :string
  end
end
