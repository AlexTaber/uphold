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

ActiveRecord::Schema.define(version: 20151210185209) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title",      null: false
    t.text     "content",    null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "band_members", force: :cascade do |t|
    t.integer  "band_id",     null: false
    t.integer  "musician_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "bands", force: :cascade do |t|
    t.string   "name",       null: false
    t.text     "bio"
    t.integer  "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bands_users", force: :cascade do |t|
    t.integer  "band_id",    null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bands_venues", force: :cascade do |t|
    t.integer  "band_id",    null: false
    t.integer  "venue_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.integer  "band_id",    null: false
    t.integer  "event_id",   null: false
    t.integer  "rank",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name",                             null: false
    t.text     "description",                      null: false
    t.datetime "start_time",                       null: false
    t.datetime "end_time",                         null: false
    t.integer  "total_headliners", default: 1,     null: false
    t.boolean  "live",             default: false, null: false
    t.integer  "venue_id",                         null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "url",            null: false
    t.integer  "imageable_id",   null: false
    t.string   "imageable_type", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "links", force: :cascade do |t|
    t.string   "url",           null: false
    t.string   "name",          null: false
    t.integer  "linkable_id",   null: false
    t.string   "linkable_type", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "musicians", force: :cascade do |t|
    t.string   "first_name",  null: false
    t.string   "last_name",   null: false
    t.text     "bio"
    t.string   "instruments"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "packages", force: :cascade do |t|
    t.string   "name",                                null: false
    t.text     "description"
    t.decimal  "price",       precision: 9, scale: 2, null: false
    t.integer  "event_id",                            null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "sales", force: :cascade do |t|
    t.string   "key",        null: false
    t.integer  "user_id",    null: false
    t.integer  "package_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sounds", force: :cascade do |t|
    t.string   "url",            null: false
    t.integer  "soundable_id",   null: false
    t.string   "soundable_type", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                           null: false
    t.string   "first_name",                      null: false
    t.string   "last_name",                       null: false
    t.string   "password_digest",                 null: false
    t.text     "bio"
    t.boolean  "admin",           default: false, null: false
    t.integer  "venue_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "venues", force: :cascade do |t|
    t.string   "name",       null: false
    t.text     "bio",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "videos", force: :cascade do |t|
    t.string   "url",            null: false
    t.integer  "videoable_id",   null: false
    t.string   "videoable_type", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
