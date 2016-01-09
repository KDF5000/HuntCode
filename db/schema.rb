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

ActiveRecord::Schema.define(version: 20160106161228) do

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.string   "intro_content"
    t.integer  "users_id"
    t.string   "source_url"
    t.integer  "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "projects", ["users_id"], name: "index_projects_on_users_id"

  create_table "stars", force: :cascade do |t|
    t.integer  "users_id"
    t.integer  "projects_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "stars", ["projects_id"], name: "index_stars_on_projects_id"
  add_index "stars", ["users_id"], name: "index_stars_on_users_id"

  create_table "subscribes", force: :cascade do |t|
    t.string   "sub_email"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "thirdparty", force: :cascade do |t|
    t.string   "identifier"
    t.integer  "users_id"
    t.integer  "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "thirdparty", ["users_id"], name: "index_thirdparty_on_users_id"

  create_table "users", force: :cascade do |t|
    t.string   "x_username"
    t.string   "x_email"
    t.integer  "x_projects_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "avatar"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"
  add_index "users", ["x_projects_id"], name: "index_users_on_x_projects_id"

end
