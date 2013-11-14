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

ActiveRecord::Schema.define(version: 20131103131326) do

  create_table "books", force: true do |t|
    t.string   "title"
    t.string   "author"
    t.string   "gender"
    t.string   "edition"
    t.string   "year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "loans", force: true do |t|
    t.date     "data"
    t.integer  "user_id"
    t.integer  "book_id"
    t.string   "status",     default: "open"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "loans", ["book_id", "created_at"], name: "index_loans_on_book_id_and_created_at"
  add_index "loans", ["user_id", "created_at"], name: "index_loans_on_user_id_and_created_at"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "users_file_name"
    t.string   "users_content_type"
    t.integer  "users_file_size"
    t.datetime "users_updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "remember_token"
    t.boolean  "admin"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
