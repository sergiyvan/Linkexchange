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

ActiveRecord::Schema.define(version: 20140402082637) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customer_categories", force: true do |t|
    t.integer  "customer_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customer_partials", force: true do |t|
    t.integer  "customer_id"
    t.integer  "partial_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "name",                         null: false
    t.string   "webadress",                    null: false
    t.string   "acc_type",   default: "basic", null: false
    t.string   "access_key",                   null: false
    t.boolean  "is_active",  default: false,   null: false
    t.integer  "google_pr",  default: -1,      null: false
    t.integer  "yandex_tic", default: -1,      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customers", ["access_key"], name: "index_customers_on_access_key", unique: true, using: :btree
  add_index "customers", ["name"], name: "index_customers_on_name", unique: true, using: :btree
  add_index "customers", ["webadress"], name: "index_customers_on_webadress", unique: true, using: :btree

  create_table "known_urls", force: true do |t|
    t.text     "url"
    t.integer  "customer_id"
    t.integer  "partial_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "partial_known_urls", force: true do |t|
    t.integer  "partial_id"
    t.integer  "known_url_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "partials", force: true do |t|
    t.text     "partial_html"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
