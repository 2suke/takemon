class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.integer :fan_id
      t.integer :bookmark_id
      t.timestamps
    end
    add_index :favorites, :fan_id
    add_index :favorites, :bookmark_id
    add_index :favorites, %i[fan_id bookmark_id], unique: true
  end
end
