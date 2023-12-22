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

ActiveRecord::Schema[7.0].define(version: 2023_12_22_232013) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bills", force: :cascade do |t|
    t.string "bill_number"
    t.string "title"
    t.string "description"
    t.string "bill_status"
    t.string "bill_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roll_call_votes", force: :cascade do |t|
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
    t.index ["bill_id"], name: "index_roll_call_votes_on_bill_id"
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

  add_foreign_key "roll_call_votes", "bills"
  add_foreign_key "roll_calls", "bills"
end
