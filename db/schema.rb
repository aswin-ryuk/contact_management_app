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

ActiveRecord::Schema.define(version: 2023_11_15_152628) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collections", force: :cascade do |t|
    t.decimal "amount", precision: 38, scale: 1
    t.string "reference"
    t.date "collection_date"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
    t.text "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "courses", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "position"
    t.string "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses_students", id: false, force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "student_id", null: false
    t.index ["course_id", "student_id"], name: "index_courses_students_on_course_id_and_student_id"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "excavators", force: :cascade do |t|
    t.string "company_name"
    t.string "address"
    t.boolean "crew_on_site"
    t.bigint "ticket_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ticket_id"], name: "index_excavators_on_ticket_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string "name"
    t.string "user_comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.string "brand_manager"
    t.string "narration"
    t.date "invoice_date"
    t.decimal "amount", precision: 38, scale: 1
    t.string "customer_name"
    t.string "reference"
  end

  create_table "reports", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "glucose_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "students", id: :serial, force: :cascade do |t|
    t.string "name"
    t.date "dob"
    t.string "gender"
    t.string "contact_number"
    t.string "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string "request_number"
    t.decimal "sequence_number"
    t.string "request_type"
    t.string "request_action"
    t.datetime "response_due_datetime"
    t.string "primary_service_area_code"
    t.text "additional_service_area_codes"
    t.text "digsite_info"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "excavators", "tickets"
end
