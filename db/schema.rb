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

ActiveRecord::Schema.define(version: 2021_01_20_213718) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "user_id"
    t.string "phone"
    t.string "fb_link"
    t.text "maps"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "subcategory_id"
    t.integer "qtdscore"
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "coupons", force: :cascade do |t|
    t.string "name"
    t.integer "value"
    t.integer "company_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offers", force: :cascade do |t|
    t.string "name"
    t.float "old_price"
    t.float "new_price"
    t.text "description"
    t.integer "company_id"
    t.integer "qtdscore"
    t.datetime "start_time"
    t.string "end_time"
    t.string "datetime"
    t.boolean "parceled"
    t.integer "qtd_parcel"
    t.boolean "cash"
    t.boolean "credit_card"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "review_offers", force: :cascade do |t|
    t.text "description"
    t.integer "user_id"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "offer_id"
    t.text "answer"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "score"
    t.integer "price"
    t.string "description"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subcategories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.bigint "role_id", null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string "activation_state"
    t.string "activation_token"
    t.datetime "activation_token_expires_at"
    t.index ["activation_token"], name: "index_users_on_activation_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["remember_me_token"], name: "index_users_on_remember_me_token"
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "companies", "users"
  add_foreign_key "users", "roles"
end
