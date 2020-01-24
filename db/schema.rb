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

ActiveRecord::Schema.define(version: 2020_01_22_202444) do

  create_table "appointments", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.integer "barber_id", null: false
    t.integer "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["barber_id"], name: "index_appointments_on_barber_id"
    t.index ["customer_id"], name: "index_appointments_on_customer_id"
  end

  create_table "barber_shops", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "barbers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "barber_shop_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["barber_shop_id"], name: "index_barbers_on_barber_shop_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "phone_number"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "haircuts", force: :cascade do |t|
    t.string "style"
    t.string "date"
    t.integer "barber_id", null: false
    t.integer "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["barber_id"], name: "index_haircuts_on_barber_id"
    t.index ["customer_id"], name: "index_haircuts_on_customer_id"
  end

  add_foreign_key "appointments", "barbers"
  add_foreign_key "appointments", "customers"
  add_foreign_key "haircuts", "barbers"
  add_foreign_key "haircuts", "customers"
end
