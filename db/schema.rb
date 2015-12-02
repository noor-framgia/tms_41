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

ActiveRecord::Schema.define(version: 20151202022001) do

  create_table "activities", force: :cascade do |t|
    t.string   "activity_type"
    t.integer  "user_id"
    t.integer  "target_id"
    t.integer  "course_id"
    t.integer  "subject_id"
    t.integer  "task_id"
    t.string   "action_message"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "activities", ["user_id"], name: "index_activities_on_user_id"

  create_table "course_subjects", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "course_subjects", ["course_id"], name: "index_course_subjects_on_course_id"
  add_index "course_subjects", ["subject_id"], name: "index_course_subjects_on_subject_id"

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "is_open"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "current_course_subject_tasks", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "subject_id"
    t.integer  "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "current_course_subject_tasks", ["course_id"], name: "index_current_course_subject_tasks_on_course_id"
  add_index "current_course_subject_tasks", ["subject_id"], name: "index_current_course_subject_tasks_on_subject_id"
  add_index "current_course_subject_tasks", ["task_id"], name: "index_current_course_subject_tasks_on_task_id"

  create_table "reports", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "todays_date"
    t.text     "todays_task"
    t.text     "tomorrows_task"
    t.text     "free_comment"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "reports", ["user_id"], name: "index_reports_on_user_id"

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "subject_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "tasks", ["subject_id"], name: "index_tasks_on_subject_id"

  create_table "user_completed_tasks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_completed_tasks", ["task_id"], name: "index_user_completed_tasks_on_task_id"
  add_index "user_completed_tasks", ["user_id"], name: "index_user_completed_tasks_on_user_id"

  create_table "user_courses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "deadline"
    t.boolean  "is_completed"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "user_courses", ["course_id"], name: "index_user_courses_on_course_id"
  add_index "user_courses", ["user_id"], name: "index_user_courses_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "role"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
