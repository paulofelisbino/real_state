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

ActiveRecord::Schema.define(version: 2020_04_19_003723) do

  create_table "properties", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "bathrooms", default: 0
    t.integer "category"
    t.text "description"
    t.boolean "furniture", default: false
    t.integer "parking_space", default: 0
    t.boolean "pet_friendly", default: false
    t.integer "property_type_id"
    t.decimal "price", precision: 10, scale: 2
    t.string "reference"
    t.integer "rooms", default: 0
    t.integer "size"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category"], name: "index_properties_on_category"
    t.index ["property_type_id"], name: "index_properties_on_property_type_id"
  end

  create_table "property_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
