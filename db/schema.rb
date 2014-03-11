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

ActiveRecord::Schema.define(version: 20140309125646) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "invitees", force: true do |t|
    t.integer  "user_id"
    t.integer  "meetup_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "response",   default: "no_reply"
  end

  create_table "meetups", force: true do |t|
    t.string   "studying"
    t.text     "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "number_of_people"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "admin",                           default: false
    t.string   "address"
    t.string   "city"
    t.string   "state_province"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "country"
    t.string   "learning"
    t.string   "preferred_gender"
    t.string   "smoking_allowed"
    t.string   "has_pets"
    t.string   "can_host_pets"
    t.string   "can_host_children"
    t.string   "description"
    t.string   "image"
    t.string   "currently_available"
    t.boolean  "study_location_available"
    t.string   "current_online_learning"
    t.text     "education"
    t.text     "languages"
    t.text     "skills"
  end

  add_index "users", ["activation_token"], name: "index_users_on_activation_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree

end
