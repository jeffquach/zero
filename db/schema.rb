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

ActiveRecord::Schema.define(version: 20140328031821) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: true do |t|
    t.integer  "user_id",    null: false
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "meetup_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendships", force: true do |t|
    t.integer  "chosen_study_partner_id"
    t.integer  "accepted_study_partner_id"
    t.string   "status",                    default: "pending"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friendships", ["accepted_study_partner_id"], name: "index_friendships_on_accepted_study_partner_id", using: :btree
  add_index "friendships", ["chosen_study_partner_id"], name: "index_friendships_on_chosen_study_partner_id", using: :btree

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
    t.integer  "user_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "review_writer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "experience"
  end

  add_index "topics", ["name"], name: "index_topics_on_name", using: :btree

  create_table "user_friendships", force: true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
  end

  add_index "user_friendships", ["state"], name: "index_user_friendships_on_state", using: :btree
  add_index "user_friendships", ["user_id", "friend_id"], name: "index_user_friendships_on_user_id_and_friend_id", using: :btree

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
    t.string   "preferred_gender"
    t.string   "smoking_allowed"
    t.string   "has_pets"
    t.string   "can_host_pets"
    t.string   "can_host_children"
    t.string   "image"
    t.string   "currently_available"
    t.boolean  "study_location_available"
    t.string   "current_online_learning"
    t.text     "education"
    t.text     "languages"
    t.text     "skills"
    t.text     "bio"
  end

  add_index "users", ["activation_token"], name: "index_users_on_activation_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree

end
