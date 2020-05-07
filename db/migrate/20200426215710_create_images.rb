class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :description
      t.string :image
      t.references :portfolio, foreign_key: true
      t.timestamps
    end
  end
end
