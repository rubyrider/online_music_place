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

ActiveRecord::Schema.define(version: 20151217185406) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "ad_positions", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "admin_users", force: :cascade do |t|
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
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "advertisements", force: :cascade do |t|
    t.string   "title",          limit: 255
    t.text     "content",        limit: 65535
    t.date     "from_date"
    t.date     "end_date"
    t.boolean  "featured"
    t.string   "ad_position_id", limit: 255
    t.float    "height",         limit: 24
    t.float    "width",          limit: 24
    t.boolean  "modal"
    t.text     "custom_css",     limit: 65535
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "right_position"
    t.boolean  "left_position"
  end

  add_index "advertisements", ["ad_position_id"], name: "index_advertisements_on_ad_position_id", using: :btree

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
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.boolean  "anonymous",                default: false
    t.string   "cover",        limit: 255
    t.boolean  "new_release"
    t.string   "banner",       limit: 255
    t.float    "popularity",   limit: 24,  default: 10.0
    t.string   "slug",         limit: 255
  end

  add_index "albums", ["slug"], name: "index_albums_on_slug", unique: true, using: :btree

  create_table "analytics", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "content_type", limit: 255
    t.string   "metric_name",  limit: 255
    t.string   "count",        limit: 255
    t.integer  "content_id",   limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "analytics", ["content_id"], name: "index_analytics_on_content_id", using: :btree

  create_table "artists", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "age",             limit: 255
    t.string   "dob",             limit: 255
    t.string   "details",         limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "musical_band_id", limit: 4
    t.boolean  "anonymous"
    t.integer  "gender",          limit: 4
    t.string   "cover",           limit: 255
    t.string   "photo",           limit: 255
    t.string   "slug",            limit: 255
    t.boolean  "band"
    t.boolean  "band_leader"
    t.string   "role",            limit: 255
    t.integer  "band_id",         limit: 4
  end

  add_index "artists", ["band_id"], name: "index_artists_on_band_id", using: :btree
  add_index "artists", ["musical_band_id"], name: "index_artists_on_musical_band_id", using: :btree
  add_index "artists", ["slug"], name: "index_artists_on_slug", unique: true, using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "slug",       limit: 255
  end

  add_index "categories", ["slug"], name: "index_categories_on_slug", unique: true, using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "slogan",     limit: 255
    t.text     "details",    limit: 65535
    t.date     "since"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "logo",       limit: 255
    t.string   "banner",     limit: 255
  end

  create_table "follows", force: :cascade do |t|
    t.integer  "followable_id",   limit: 4,                   null: false
    t.string   "followable_type", limit: 255,                 null: false
    t.integer  "follower_id",     limit: 4,                   null: false
    t.string   "follower_type",   limit: 255,                 null: false
    t.boolean  "blocked",                     default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["followable_id", "followable_type"], name: "fk_followables", using: :btree
  add_index "follows", ["follower_id", "follower_type"], name: "fk_follows", using: :btree

  create_table "identities", force: :cascade do |t|
    t.string   "uid",        limit: 255
    t.string   "provider",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id",    limit: 4
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "languages", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "key",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "liked_albums", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "album_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "liked_artists", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "artist_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "liked_play_lists", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "play_list_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "liked_songs", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "song_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "musical_bands", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "details",       limit: 255
    t.date     "date_of_birth"
    t.boolean  "active"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "play_list_songs", force: :cascade do |t|
    t.integer  "play_list_id", limit: 4
    t.integer  "song_id",      limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "play_list_songs", ["play_list_id"], name: "index_play_list_songs_on_play_list_id", using: :btree
  add_index "play_list_songs", ["song_id"], name: "index_play_list_songs_on_song_id", using: :btree

  create_table "play_lists", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.integer  "user_id",          limit: 4
    t.boolean  "system_play_list"
    t.string   "aasm_state",       limit: 255
    t.integer  "share_count",      limit: 4
    t.boolean  "featured"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "left_side"
    t.boolean  "mood"
    t.string   "cover",            limit: 255
    t.string   "slug",             limit: 255
  end

  add_index "play_lists", ["slug"], name: "index_play_lists_on_slug", unique: true, using: :btree

  create_table "portal_configurations", force: :cascade do |t|
    t.string   "meta_title",          limit: 255
    t.text     "meta_description",    limit: 65535
    t.text     "meta_keywords",       limit: 65535
    t.string   "site_title",          limit: 255
    t.string   "facebook_api_key",    limit: 255
    t.string   "facebook_api_secret", limit: 255
    t.string   "facebook_profile",    limit: 255
    t.string   "linkedin_profile",    limit: 255
    t.string   "twitter_profile",     limit: 255
    t.string   "google_profile",      limit: 255
    t.string   "version",             limit: 255
    t.string   "hotline",             limit: 255
    t.string   "contact_email",       limit: 255
    t.string   "address_line_one",    limit: 255
    t.string   "address_line_two",    limit: 255
    t.string   "city",                limit: 255
    t.string   "state",               limit: 255
    t.string   "country",             limit: 255
    t.string   "province",            limit: 255
    t.string   "zip",                 limit: 255
    t.string   "logo",                limit: 255
    t.text     "about",               limit: 65535
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
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

  create_table "song_languages", force: :cascade do |t|
    t.integer  "song_id",     limit: 4
    t.integer  "language_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "song_languages", ["language_id"], name: "index_song_languages_on_language_id", using: :btree
  add_index "song_languages", ["song_id"], name: "index_song_languages_on_song_id", using: :btree

  create_table "songs", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "album_id",      limit: 255
    t.string   "filename",      limit: 255
    t.string   "asset",         limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "track_id",      limit: 4
    t.integer  "demo_track_id", limit: 4
    t.string   "artist_name",   limit: 255
    t.string   "audio",         limit: 255
    t.float    "duration",      limit: 24
    t.string   "picture",       limit: 255
    t.string   "slug",          limit: 255
  end

  add_index "songs", ["slug"], name: "index_songs_on_slug", unique: true, using: :btree

  create_table "subscriptions", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "details",    limit: 65535
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "active"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "tracks", force: :cascade do |t|
    t.integer  "song_id",            limit: 4
    t.string   "name",               limit: 255
    t.string   "duration",           limit: 255
    t.integer  "demo_song_id",       limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "attachment",         limit: 255
    t.string   "audio_file_name",    limit: 255
    t.string   "audio_content_type", limit: 255
    t.integer  "audio_file_size",    limit: 4
    t.datetime "audio_updated_at"
  end

  add_index "tracks", ["demo_song_id"], name: "index_tracks_on_demo_song_id", using: :btree
  add_index "tracks", ["song_id"], name: "index_tracks_on_song_id", using: :btree

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
    t.integer  "subscription_id",        limit: 4
    t.string   "authentication_token",   limit: 255
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.integer  "gender",                 limit: 4
    t.string   "avatar",                 limit: 255
    t.boolean  "admin"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["subscription_id"], name: "index_users_on_subscription_id", using: :btree

  add_foreign_key "album_artists", "albums"
  add_foreign_key "album_artists", "artists"
  add_foreign_key "album_categories", "albums"
  add_foreign_key "album_categories", "categories"
  add_foreign_key "identities", "users"
  add_foreign_key "play_list_songs", "play_lists"
  add_foreign_key "play_list_songs", "songs"
  add_foreign_key "song_artists", "artists"
  add_foreign_key "song_artists", "songs"
  add_foreign_key "song_categories", "categories"
  add_foreign_key "song_categories", "songs"
  add_foreign_key "song_languages", "languages"
  add_foreign_key "song_languages", "songs"
  add_foreign_key "tracks", "songs"
  add_foreign_key "users", "subscriptions"
end
