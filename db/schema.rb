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

ActiveRecord::Schema.define(version: 20150519184119) do

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "kalibro_modules", force: :cascade do |t|
    t.string   "long_name"
    t.string   "granularity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "module_result_id"
  end

  create_table "metric_results", force: :cascade do |t|
    t.integer  "module_result_id"
    t.integer  "metric_configuration_id"
    t.float    "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "module_results", force: :cascade do |t|
    t.float    "grade"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "processing_id"
  end

  add_index "module_results", ["parent_id"], name: "index_module_results_on_parent_id"

  create_table "process_times", force: :cascade do |t|
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "processing_id"
    t.float    "time"
  end

  create_table "processings", force: :cascade do |t|
    t.string   "state"
    t.integer  "repository_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "root_module_result_id"
    t.text     "error_message"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "repositories", force: :cascade do |t|
    t.string   "name"
    t.string   "scm_type"
    t.string   "address"
    t.string   "description",              default: ""
    t.string   "license",                  default: ""
    t.integer  "period",                   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "kalibro_configuration_id"
    t.integer  "project_id"
    t.string   "code_directory"
  end

end
