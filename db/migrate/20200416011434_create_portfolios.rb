class CreatePortfolios < ActiveRecord::Migration[6.0]
  def change
    create_table :portfolios do |t|
      t.string :title
      t.string :detail
      t.references :user, foreign_key: true
      t.timestamps
    end
    add_index :portfolios, %i[user_id created_at]
  end
end
