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

ActiveRecord::Schema.define(version: 20140508193948) do

  create_table "duplicate_rows", force: true do |t|
    t.string   "file_path"
    t.integer  "row_number"
    t.boolean  "resolved"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "file_sorters", force: true do |t|
    t.string "file_path"
    t.string "working_directory"
  end

  create_table "pictures", force: true do |t|
    t.string   "file_name"
    t.string   "original_file_name"
    t.string   "format"
    t.string   "geometry"
    t.string   "colors"
    t.string   "size"
    t.string   "resolution"
    t.integer  "duplicate_row_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_path"
    t.string   "original_file_path"
  end

  create_table "properties", force: true do |t|
    t.integer  "picture_id"
    t.string   "name"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
