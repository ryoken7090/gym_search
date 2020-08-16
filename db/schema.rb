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

ActiveRecord::Schema.define(version: 2020_08_15_101136) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.index ["city_id"], name: "index_facilities_on_city_id"
    t.index ["name"], name: "index_facilities_on_name", unique: true
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

  add_foreign_key "facilities", "cities"
end
