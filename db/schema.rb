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

ActiveRecord::Schema.define(version: 20160719064908) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: :cascade do |t|
    t.string   "message_id"
    t.string   "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "description"
  end

  create_table "resumes", force: :cascade do |t|
    t.string   "name"
    t.string   "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tb_user", force: :cascade do |t|
    t.string "user_id",         limit: 30
    t.string "user_name",       limit: 100
    t.string "password_digest", limit: 100
    t.string "password_salt",   limit: 100
    t.date   "date_of_birth"
    t.string "email",           limit: 200
    t.text   "note"
    t.date   "last_login"
  end

  create_table "user_images", force: :cascade do |t|
    t.string   "name"
    t.string   "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_models", force: :cascade do |t|
    t.string   "user_id",         limit: 30
    t.string   "user_name",       limit: 100
    t.string   "password_digest", limit: 100
    t.string   "password_salt",   limit: 100
    t.date     "date_of_birth"
    t.string   "email",           limit: 200
    t.string   "img_url",         limit: 256
    t.string   "note"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
