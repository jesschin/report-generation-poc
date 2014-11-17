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

ActiveRecord::Schema.define(version: 20140725071804) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "csv_reports", force: true do |t|
    t.json     "json_data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "report_file_file_name"
    t.string   "report_file_content_type"
    t.integer  "report_file_file_size"
    t.datetime "report_file_updated_at"
  end

  create_table "outlets", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_data", force: true do |t|
    t.string   "product_name"
    t.string   "product_type"
    t.integer  "quantity"
    t.integer  "throwaway"
    t.decimal  "price",         precision: 6, scale: 2
    t.string   "branch"
    t.integer  "csv_report_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "report_entries", force: true do |t|
    t.integer  "outlet_id"
    t.integer  "shift_id"
    t.integer  "user_id"
    t.date     "report_date"
    t.decimal  "total_sales",   precision: 10, scale: 2
    t.decimal  "cash_remitted", precision: 10, scale: 2
    t.decimal  "short",         precision: 10, scale: 2
    t.string   "remarks"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "report_entries", ["outlet_id"], name: "index_report_entries_on_outlet_id", using: :btree
  add_index "report_entries", ["shift_id"], name: "index_report_entries_on_shift_id", using: :btree
  add_index "report_entries", ["user_id"], name: "index_report_entries_on_user_id", using: :btree

  create_table "shifts", force: true do |t|
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "address_2"
    t.string   "state"
    t.string   "zip_code"
    t.integer  "age"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.json     "preferences"
  end

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
