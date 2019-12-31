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

ActiveRecord::Schema.define(version: 2019_12_31_184205) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string "answer_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "question_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "codes", force: :cascade do |t|
    t.string "color"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.string "section"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_courses_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "question_text"
    t.boolean "visible"
    t.boolean "answered"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "session_id"
    t.index ["session_id"], name: "index_questions_on_session_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "task"
    t.string "task_objective"
    t.datetime "session_start"
    t.datetime "session_end"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "course_id"
    t.index ["course_id"], name: "index_sessions_on_course_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.datetime "status_start"
    t.datetime "status_end"
    t.string "student_comment"
    t.string "teacher_comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "session_id"
    t.bigint "code_id"
    t.index ["code_id"], name: "index_statuses_on_code_id"
    t.index ["session_id"], name: "index_statuses_on_session_id"
    t.index ["user_id"], name: "index_statuses_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "pronouns"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "courses", "users"
  add_foreign_key "questions", "sessions"
  add_foreign_key "questions", "users"
  add_foreign_key "sessions", "courses"
  add_foreign_key "statuses", "codes"
  add_foreign_key "statuses", "sessions"
  add_foreign_key "statuses", "users"
end
