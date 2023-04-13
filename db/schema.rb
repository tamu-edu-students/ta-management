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

ActiveRecord::Schema[7.0].define(version: 2023_04_07_182952) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.bigint "subject_id"
    t.bigint "student_id"
    t.bigint "professor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["professor_id"], name: "index_assignments_on_professor_id"
    t.index ["student_id"], name: "index_assignments_on_student_id"
    t.index ["subject_id"], name: "index_assignments_on_subject_id"
  end

  create_table "managements", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.string "name"
    t.index ["user_id"], name: "index_managements_on_user_id"
  end

  create_table "professors", force: :cascade do |t|
    t.string "course_list"
    t.string "course_section"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "email_id"
    t.integer "user_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.text "code"
    t.integer "course_id"
    t.integer "section"
    t.text "lecture_day"
    t.text "start_time"
    t.text "end_time"
    t.text "professor"
    t.text "students", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.boolean "employment_status"
    t.boolean "is_undergrad"
    t.text "courses_completed", default: [], array: true
    t.string "resume"
    t.string "transcript"
    t.text "access_level", default: ["applicant"], array: true
    t.string "application_status", default: "applied"
    t.string "comments"
    t.text "assigned_courses", default: [], array: true
    t.text "assigned_sections", default: [], array: true
    t.integer "rating"
    t.string "feedback"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_active"
    t.integer "uin"
    t.integer "user_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "course_name"
    t.string "course_section"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email_id"
    t.string "password"
    t.string "access_level", default: "TA"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "password_digest"
  end

  add_foreign_key "assignments", "professors"
  add_foreign_key "assignments", "students"
  add_foreign_key "assignments", "subjects"
  add_foreign_key "managements", "users"
  add_foreign_key "professors", "users"
  add_foreign_key "students", "users"
end
