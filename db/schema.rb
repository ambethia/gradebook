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

ActiveRecord::Schema.define(version: 20150817194651) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "homework_id"
    t.integer  "issue"
    t.integer  "score",      default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end
  add_index "assignments", ["homework_id"], name: "index_assignments_on_homework_id", using: :btree
  add_index "assignments", ["student_id"], name: "index_assignments_on_student_id", using: :btree

  create_table "cohorts", force: :cascade do |t|
    t.string   "name"
    t.string   "org"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "is_active"
  end

  create_table "homework", force: :cascade do |t|
    t.string   "name"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "summary"
    t.integer  "cohort_id"
  end

  add_index "homework", ["cohort_id"], name: "index_homework_on_cohort_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.integer  "cohort_id"
    t.string   "name"
    t.string   "github"
    t.string   "assignments_repo"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "is_active",        default: true
  end

  add_index "students", ["cohort_id"], name: "index_students_on_cohort_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.string   "nickname"
    t.string   "access_token"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "cohort_id"
  end

  add_index "users", ["cohort_id"], name: "index_users_on_cohort_id", using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  add_foreign_key "assignments", "homework"
  add_foreign_key "assignments", "students"
  add_foreign_key "homework", "cohorts"
  add_foreign_key "students", "cohorts"
  add_foreign_key "users", "cohorts"
end
