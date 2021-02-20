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

ActiveRecord::Schema.define(version: 2021_02_06_032608) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "name", null: false
    t.string "ancestry"
    t.integer "ancestry_depth"
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_departments_on_company_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "first_name_kana", null: false
    t.string "last_name_kana", null: false
    t.string "middle_name"
    t.string "middle_name_kana"
    t.boolean "sex", null: false
    t.date "hired_at", null: false
    t.date "retired_at"
    t.bigint "company_id", null: false
    t.bigint "position_id", null: false
    t.bigint "department_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_employees_on_company_id"
    t.index ["department_id"], name: "index_employees_on_department_id"
    t.index ["position_id"], name: "index_employees_on_position_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "customer_name", null: false
    t.integer "price", null: false
    t.integer "status", null: false
    t.date "ordered_at", null: false
    t.bigint "employee_id", null: false
    t.bigint "company_id", null: false
    t.bigint "department_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_orders_on_company_id"
    t.index ["department_id"], name: "index_orders_on_department_id"
    t.index ["employee_id"], name: "index_orders_on_employee_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_positions_on_company_id"
  end

  add_foreign_key "departments", "companies"
  add_foreign_key "employees", "companies"
  add_foreign_key "employees", "departments"
  add_foreign_key "employees", "positions"
  add_foreign_key "orders", "companies"
  add_foreign_key "orders", "departments"
  add_foreign_key "orders", "employees"
  add_foreign_key "positions", "companies"
end
