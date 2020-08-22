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

ActiveRecord::Schema.define(version: 2020_08_21_055831) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipments", force: :cascade do |t|
    t.integer "name", null: false
    t.integer "amount"
    t.bigint "facility_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facility_id"], name: "index_equipments_on_facility_id"
  end

  create_table "facilities", force: :cascade do |t|
    t.string "name", null: false
    t.integer "drop", default: 0
    t.integer "parking", default: 0
    t.integer "shower", default: 0
    t.integer "recordable", default: 0
    t.integer "visiter", default: 0
    t.integer "monthly_fee"
    t.integer "accessible_ten_min", default: 0
    t.integer "trainer", default: 0
    t.integer "open_all_time", default: 0
    t.string "station"
    t.string "description_station"
    t.string "address"
    t.string "tell"
    t.string "hp_url"
    t.string "regular_holiday"
    t.string "business_hours"
    t.string "image"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "city_id"
    t.bigint "poster_id", null: false
    t.index ["city_id"], name: "index_facilities_on_city_id"
    t.index ["name"], name: "index_facilities_on_name", unique: true
    t.index ["poster_id"], name: "index_facilities_on_poster_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "facility_id"
    t.text "content"
    t.integer "machine", null: false
    t.integer "caedio", null: false
    t.integer "free_weight", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facility_id"], name: "index_reviews_on_facility_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer "facility_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "equipments", "facilities"
  add_foreign_key "facilities", "cities"
  add_foreign_key "facilities", "users", column: "poster_id"
  add_foreign_key "reviews", "facilities"
  add_foreign_key "reviews", "users"
end
