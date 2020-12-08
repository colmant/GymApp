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

ActiveRecord::Schema.define(version: 2020_12_07_223658) do

  create_table "gyms", force: :cascade do |t|
    t.integer "top_floor_occupancy"
    t.integer "bottom_floor_occupancy"
    t.integer "top_floor_capacity"
    t.integer "bottom_floor_capacity"
    t.integer "wait_top_floor"
    t.integer "wait_bottom_floor"
    t.integer "ticket_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["ticket_id"], name: "index_gyms_on_ticket_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "name"
    t.integer "gym_id"
    t.integer "tickets_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.string "floor"
    t.index ["gym_id"], name: "index_tickets_on_gym_id"
    t.index ["tickets_id"], name: "index_tickets_on_tickets_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "trudy_trends", force: :cascade do |t|
    t.string "day_of_week"
    t.decimal "average_queue_time", precision: 10, scale: 2
    t.integer "average_queue_size"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "admin", default: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "gyms", "tickets", on_delete: :cascade
  add_foreign_key "tickets", "gyms"
  add_foreign_key "tickets", "tickets", column: "tickets_id"
  add_foreign_key "tickets", "users"
end
