# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_200_507_024_418) do
  create_table 'comments', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.string 'message'
    t.bigint 'user_id'
    t.bigint 'portfolio_id'
    t.integer 'base'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['portfolio_id'], name: 'index_comments_on_portfolio_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  create_table 'images', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.string 'description'
    t.string 'image'
    t.bigint 'portfolio_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['portfolio_id'], name: 'index_images_on_portfolio_id'
  end

  create_table 'portfolios', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.string 'title'
    t.string 'detail'
    t.bigint 'user_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[user_id created_at], name: 'index_portfolios_on_user_id_and_created_at'
    t.index ['user_id'], name: 'index_portfolios_on_user_id'
  end

  create_table 'users', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'password_digest'
    t.string 'remember_digest'
    t.string 'activation_digest'
    t.boolean 'activated', default: false
    t.datetime 'activated_at'
    t.string 'reset_digest'
    t.datetime 'reset_sent_at'
    t.index ['email'], name: 'index_users_on_email', unique: true
  end

  add_foreign_key 'comments', 'portfolios'
  add_foreign_key 'comments', 'users'
  add_foreign_key 'images', 'portfolios'
  add_foreign_key 'portfolios', 'users'
end
