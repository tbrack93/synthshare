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

ActiveRecord::Schema.define(version: 2018_07_08_215958) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "synth_id"
    t.text "details"
    t.integer "price"
    t.string "status", default: "pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "start_time"
    t.date "end_time"
    t.datetime "lastmessage"
    t.integer "unreadmessages", default: 0
    t.index ["synth_id"], name: "index_bookings_on_synth_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "booking_id"
    t.string "status", default: "new"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_messages_on_booking_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "synths", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "body_format"
    t.string "model_no"
    t.string "processor"
    t.string "memory"
    t.string "battery_life"
    t.string "build_date"
    t.boolean "cleaning", default: false
    t.boolean "cooking", default: false
    t.boolean "childcare", default: false
    t.boolean "diy", default: false
    t.boolean "construction", default: false
    t.boolean "painting", default: false
    t.boolean "gardening", default: false
    t.boolean "healthcare", default: false
    t.boolean "elderlycare", default: false
    t.boolean "animalcare", default: false
    t.boolean "driving", default: false
    t.boolean "self_defense", default: false
    t.boolean "security", default: false
    t.boolean "entertainment", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.bigint "user_id"
    t.boolean "cardiothoracic", default: false
    t.boolean "quantumelectrodynamics", default: false
    t.boolean "architecturalengineering", default: false
    t.boolean "hostagenegotiation", default: false
    t.integer "price"
    t.boolean "disclaimer"
    t.index ["user_id"], name: "index_synths_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.boolean "disclaimer"
    t.boolean "emailconsent"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "synths", "users"
end
