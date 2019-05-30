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

ActiveRecord::Schema.define(version: 2019_05_30_131513) do

  create_table "checkout_products", force: :cascade do |t|
    t.integer "products_id"
    t.integer "checkout_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["checkout_id"], name: "index_checkout_products_on_checkout_id"
    t.index ["products_id"], name: "index_checkout_products_on_products_id"
  end

  create_table "checkouts", force: :cascade do |t|
    t.decimal "total_amount"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["user_id"], name: "index_checkouts_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.decimal "price"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "product_pictures"
    t.integer "user_id"
    t.string "category"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "userdata_checkouts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "checkout_id"
    t.string "name"
    t.string "street"
    t.integer "external_number"
    t.integer "internal_number"
    t.string "country"
    t.string "zip_code"
    t.string "state"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["checkout_id"], name: "index_userdata_checkouts_on_checkout_id"
    t.index ["user_id"], name: "index_userdata_checkouts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
