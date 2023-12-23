# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_12_22_232806) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bills", force: :cascade do |t|
    t.string "bill_number"
    t.string "title"
    t.string "description"
    t.integer "bill_status"
    t.integer "bill_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "legislator_votes", force: :cascade do |t|
    t.bigint "legislator_id", null: false
    t.bigint "roll_call_id", null: false
    t.integer "vote"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["legislator_id"], name: "index_legislator_votes_on_legislator_id"
    t.index ["roll_call_id"], name: "index_legislator_votes_on_roll_call_id"
  end

  create_table "legislators", force: :cascade do |t|
    t.integer "party"
    t.string "title"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "suffix"
    t.string "nickname"
    t.string "district"
    t.integer "chamber"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roll_calls", force: :cascade do |t|
    t.bigint "bill_id", null: false
    t.string "date"
    t.string "description"
    t.integer "ayes"
    t.integer "nays"
    t.integer "excused"
    t.integer "absent"
    t.integer "outcome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_id"], name: "index_roll_calls_on_bill_id"
  end

  add_foreign_key "legislator_votes", "legislators"
  add_foreign_key "legislator_votes", "roll_calls"
  add_foreign_key "roll_calls", "bills"
end
