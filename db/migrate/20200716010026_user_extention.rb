class UserExtention < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :icon, :string
    add_column :users, :url,  :string
    add_column :users, :bio,  :string
  end
end
