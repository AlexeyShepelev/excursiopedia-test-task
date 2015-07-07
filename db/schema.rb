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

ActiveRecord::Schema.define(version: 20150706163323) do

  create_table "category_excursion_translations", force: :cascade do |t|
    t.integer  "category_excursion_id", limit: 4,   null: false
    t.string   "locale",                limit: 255, null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "name",                  limit: 255, null: false
  end

  add_index "category_excursion_translations", ["category_excursion_id"], name: "index_category_excursion_translations_on_category_excursion_id", using: :btree
  add_index "category_excursion_translations", ["locale"], name: "index_category_excursion_translations_on_locale", using: :btree

  create_table "category_excursions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_excursions_excursions", force: :cascade do |t|
    t.integer  "excursion_id",          limit: 4
    t.integer  "category_excursion_id", limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "category_excursions_excursions", ["category_excursion_id"], name: "index_category_excursions_excursions_on_category_excursion_id", using: :btree
  add_index "category_excursions_excursions", ["excursion_id"], name: "index_category_excursions_excursions_on_excursion_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "city_translations", force: :cascade do |t|
    t.integer  "city_id",    limit: 4,   null: false
    t.string   "locale",     limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "name",       limit: 255, null: false
  end

  add_index "city_translations", ["city_id"], name: "index_city_translations_on_city_id", using: :btree
  add_index "city_translations", ["locale"], name: "index_city_translations_on_locale", using: :btree

  create_table "excursion_translations", force: :cascade do |t|
    t.integer  "excursion_id", limit: 4,     null: false
    t.string   "locale",       limit: 255,   null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "title",        limit: 255
    t.text     "description",  limit: 65535
  end

  add_index "excursion_translations", ["excursion_id"], name: "index_excursion_translations_on_excursion_id", using: :btree
  add_index "excursion_translations", ["locale"], name: "index_excursion_translations_on_locale", using: :btree

  create_table "excursions", force: :cascade do |t|
    t.boolean  "published",            default: false, null: false
    t.integer  "city_id",    limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "excursions", ["city_id"], name: "index_excursions_on_city_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.integer  "role",                   limit: 4,   default: 1,  null: false
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
