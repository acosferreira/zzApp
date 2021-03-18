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

ActiveRecord::Schema.define(version: 2021_03_18_055243) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "earnings", force: :cascade do |t|
    t.bigint "employer_id"
    t.bigint "employee_id"
    t.date "earning_date"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_earnings_on_employee_id"
    t.index ["employer_id"], name: "index_earnings_on_employer_id"
  end

  create_table "employeer_csvs", force: :cascade do |t|
    t.bigint "employer_id"
    t.string "columns"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "field_name"
    t.string "field_earnig_type"
    t.integer "field_position"
    t.string "field_format"
    t.index ["employer_id"], name: "index_employeer_csvs_on_employer_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "external_ref"
    t.bigint "employer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employer_id"], name: "index_employees_on_employer_id"
  end

  create_table "employers", force: :cascade do |t|
    t.string "name"
    t.string "string"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "earnings", "employees"
  add_foreign_key "earnings", "employers"
  add_foreign_key "employeer_csvs", "employers"
  add_foreign_key "employees", "employers"
end
