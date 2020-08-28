# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "arigatonas", force: :cascade do |t|
    t.bigint "daily_report_id", comment: "日報"
    t.bigint "user_id", comment: "ユーザ"
    t.text "comment", null: false, comment: "コメント"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["daily_report_id"], name: "index_arigatonas_on_daily_report_id"
    t.index ["user_id"], name: "index_arigatonas_on_user_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name", null: false, comment: "クライアント名"
    t.integer "users_limit", default: 0, null: false, comment: "最大ユーザ数"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_clients_on_name", unique: true
  end

  create_table "daily_reports", force: :cascade do |t|
    t.bigint "user_id", comment: "ユーザ"
    t.text "memo", comment: "メモ"
    t.datetime "date", comment: "日付"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "date"], name: "index_daily_reports_on_user_id_and_date", unique: true
    t.index ["user_id"], name: "index_daily_reports_on_user_id"
  end

  create_table "departments", force: :cascade do |t|
    t.bigint "client_id", comment: "クライアント"
    t.string "name", null: false, comment: "部署名"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_departments_on_client_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "client_id", comment: "クライアント"
    t.bigint "department_id", comment: "部署"
    t.string "unique_name", null: false, comment: "ユーザID"
    t.string "name", null: false, comment: "ユーザ名"
    t.string "password_digest", null: false, comment: "パスワードダイジェスト"
    t.integer "role", null: false, comment: "権限"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_users_on_client_id"
    t.index ["department_id"], name: "index_users_on_department_id"
    t.index ["unique_name"], name: "index_users_on_unique_name", unique: true
  end

  create_table "work_contents", force: :cascade do |t|
    t.bigint "client_id", comment: "クライアント"
    t.string "name", null: false, comment: "作業名"
    t.string "name_kana", default: "", null: false, comment: "作業名カナ"
    t.boolean "active", default: true, null: false, comment: "日報に表示"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_work_contents_on_client_id"
  end

  create_table "work_properties", force: :cascade do |t|
    t.bigint "client_id", comment: "クライアント"
    t.string "name", null: false, comment: "物件名"
    t.string "code", default: "", null: false, comment: "物件コード"
    t.boolean "active", default: true, null: false, comment: "日報に表示"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_work_properties_on_client_id"
  end

  create_table "works", force: :cascade do |t|
    t.bigint "daily_report_id", comment: "日報"
    t.bigint "work_content_id", comment: "作業内容"
    t.bigint "work_property_id", comment: "作業物件"
    t.datetime "start_at", precision: 6, null: false, comment: "開始時刻"
    t.datetime "end_at", precision: 6, null: false, comment: "終了時刻"
    t.boolean "include_rest", default: false, null: false, comment: "休憩込み"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["daily_report_id"], name: "index_works_on_daily_report_id"
    t.index ["work_content_id"], name: "index_works_on_work_content_id"
    t.index ["work_property_id"], name: "index_works_on_work_property_id"
  end

end
