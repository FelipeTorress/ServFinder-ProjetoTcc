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

ActiveRecord::Schema.define(version: 2022_08_30_010643) do

  create_table "places", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "state_code"
    t.string "postal_code"
    t.string "country"
    t.string "country_code"
  end

  create_table "services", force: :cascade do |t|
    t.integer "user_id"
    t.integer "user_selected_id"
    t.string "title"
    t.text "description"
    t.datetime "limit_date"
    t.decimal "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_services_on_title"
    t.index ["user_id"], name: "index_services_on_user_id"
  end

  create_table "user_places", force: :cascade do |t|
    t.integer "user_id"
    t.integer "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_user_places_on_place_id"
    t.index ["user_id"], name: "index_user_places_on_user_id"
  end

  create_table "user_services", force: :cascade do |t|
    t.integer "user_id"
    t.integer "service_id"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_user_services_on_service_id"
    t.index ["user_id"], name: "index_user_services_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "phone_number"
    t.boolean "permit_phone_number", default: true
    t.boolean "permit_email", default: true
    t.boolean "accepted_terms_of_use"
    t.boolean "accepted_privacy_policy"
    t.boolean "isContratante"
    t.string "address"
    t.integer "score"
    t.boolean "accepted_cookies"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index [nil], name: "index_users_on_user_selected_id"
  end

end
