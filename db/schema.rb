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

ActiveRecord::Schema.define(version: 20150919075240) do

  create_table "album_artists", force: :cascade do |t|
    t.integer  "album_id",   limit: 4
    t.integer  "artist_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "album_artists", ["album_id"], name: "index_album_artists_on_album_id", using: :btree
  add_index "album_artists", ["artist_id"], name: "index_album_artists_on_artist_id", using: :btree

  create_table "album_categories", force: :cascade do |t|
    t.integer  "album_id",    limit: 4
    t.integer  "category_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "album_categories", ["album_id"], name: "index_album_categories_on_album_id", using: :btree
  add_index "album_categories", ["category_id"], name: "index_album_categories_on_category_id", using: :btree

  create_table "albums", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.datetime "release_date"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "artist_songs", force: :cascade do |t|
    t.integer  "artist_id",  limit: 4
    t.integer  "song_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "artist_songs", ["artist_id"], name: "index_artist_songs_on_artist_id", using: :btree
  add_index "artist_songs", ["song_id"], name: "index_artist_songs_on_song_id", using: :btree

  create_table "artists", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "age",             limit: 255
    t.string   "dob",             limit: 255
    t.string   "details",         limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "musical_band_id", limit: 4
  end

  add_index "artists", ["musical_band_id"], name: "index_artists_on_musical_band_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "slogan",     limit: 255
    t.text     "details",    limit: 65535
    t.date     "since"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "musical_bands", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "details",       limit: 255
    t.date     "date_of_birth"
    t.boolean  "active"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "song_artists", force: :cascade do |t|
    t.integer  "song_id",    limit: 4
    t.integer  "artist_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "song_artists", ["artist_id"], name: "index_song_artists_on_artist_id", using: :btree
  add_index "song_artists", ["song_id"], name: "index_song_artists_on_song_id", using: :btree

  create_table "song_categories", force: :cascade do |t|
    t.integer  "song_id",     limit: 4
    t.integer  "category_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "song_categories", ["category_id"], name: "index_song_categories_on_category_id", using: :btree
  add_index "song_categories", ["song_id"], name: "index_song_categories_on_song_id", using: :btree

  create_table "songs", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "album_id",   limit: 255
    t.string   "filename",   limit: 255
    t.string   "asset",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "role",                   limit: 4,   default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "album_artists", "albums"
  add_foreign_key "album_artists", "artists"
  add_foreign_key "album_categories", "albums"
  add_foreign_key "album_categories", "categories"
  add_foreign_key "song_artists", "artists"
  add_foreign_key "song_artists", "songs"
  add_foreign_key "song_categories", "categories"
  add_foreign_key "song_categories", "songs"
end
