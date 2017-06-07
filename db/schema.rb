# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170607111356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "add_ons", force: :cascade do |t|
    t.string  "name"
    t.decimal "cost",      precision: 5, scale: 2
    t.integer "entree_id"
  end

  create_table "addresses", force: :cascade do |t|
    t.string  "street_line_1"
    t.string  "street_line_2"
    t.string  "city"
    t.string  "state"
    t.string  "zip_code"
    t.integer "user_id"
  end

  create_table "breads", force: :cascade do |t|
    t.string  "name"
    t.integer "entree_id"
  end

  create_table "condiments", force: :cascade do |t|
    t.string  "name"
    t.integer "entree_id"
  end

  create_table "drinks", force: :cascade do |t|
    t.string  "name"
    t.decimal "cost",      precision: 5, scale: 2
    t.boolean "alcoholic"
    t.integer "order_id"
  end

  create_table "entrees", force: :cascade do |t|
    t.string  "type"
    t.string  "name"
    t.decimal "cost",     precision: 5, scale: 2
    t.integer "order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.boolean "dine_in"
    t.string  "start_time"
    t.string  "served_time"
    t.decimal "cost",        precision: 5, scale: 2
    t.integer "user_id"
  end

  create_table "proteins", force: :cascade do |t|
    t.string  "name"
    t.integer "entree_id"
  end

  create_table "sides", force: :cascade do |t|
    t.string  "name"
    t.decimal "cost",     precision: 5, scale: 2
    t.integer "order_id"
  end

  create_table "users", force: :cascade do |t|
    t.string  "username"
    t.string  "password_digest"
    t.string  "email_address"
    t.string  "phone_number"
    t.integer "order_id"
    t.integer "address_id"
  end

  add_foreign_key "add_ons", "entrees"
  add_foreign_key "addresses", "users"
  add_foreign_key "breads", "entrees"
  add_foreign_key "condiments", "entrees"
  add_foreign_key "drinks", "orders"
  add_foreign_key "entrees", "orders"
  add_foreign_key "orders", "users"
  add_foreign_key "proteins", "entrees"
  add_foreign_key "sides", "orders"
  add_foreign_key "users", "addresses"
  add_foreign_key "users", "orders"
end
