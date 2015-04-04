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

ActiveRecord::Schema.define(version: 20150404014843) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "location_sessions", force: true do |t|
    t.string  "sender_lat"
    t.string  "sender_long"
    t.integer "sender_id"
    t.integer "recipient_id"
  end

  create_table "relationships", force: true do |t|
    t.integer "user_id"
    t.integer "friend_id"
  end

  create_table "users", force: true do |t|
    t.string "registration_id"
    t.string "account_name"
    t.string "display_name"
  end

end
