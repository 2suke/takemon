class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string     :message
      t.references :user,      foreign_key: true
      t.references :portfolio, foreign_key: true
      t.integer    :base
      t.timestamps
    end
  end
end
