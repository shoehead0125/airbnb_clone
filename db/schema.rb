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

ActiveRecord::Schema.define(version: 20170414034415) do

  create_table "messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.text     "body",          limit: 65535, null: false
    t.integer  "user_id",                     null: false
    t.integer  "resavation_id",               null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["resavation_id"], name: "index_messages_on_resavation_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "resavations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.date     "start_day",                           null: false
    t.date     "end_day",                             null: false
    t.integer  "price",                               null: false
    t.integer  "status",        limit: 1, default: 0, null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "occupancy"
    t.integer  "user_id"
    t.integer  "room_id"
    t.integer  "status_review", limit: 1, default: 0
    t.integer  "tour_id",                 default: 0
  end

  create_table "reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.text     "body",       limit: 65535, null: false
    t.integer  "user_id",                  null: false
    t.integer  "room_id",                  null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "rate",                     null: false
    t.index ["room_id"], name: "index_reviews_on_room_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "rooms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "category",   limit: 1,                 null: false
    t.integer  "max_number", limit: 1,                 null: false
    t.string   "address",                              null: false
    t.integer  "user_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "name"
    t.string   "image"
    t.float    "latitude",   limit: 24
    t.float    "longitude",  limit: 24
    t.text     "outline",    limit: 65535
    t.integer  "price"
    t.integer  "cleaning",                 default: 0
    t.integer  "service",                  default: 0
    t.index ["user_id"], name: "index_rooms_on_user_id", using: :btree
  end

  create_table "tours", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "user_id",    null: false
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tours_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "email",                                default: "", null: false
    t.string   "first_name",                                        null: false
    t.string   "last_name",                                         null: false
    t.string   "encrypted_password",                   default: "", null: false
    t.date     "birthday",                                          null: false
    t.integer  "status",                 limit: 1,     default: 0,  null: false
    t.text     "introduce",              limit: 65535
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "image"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "messages", "resavations"
  add_foreign_key "messages", "users"
  add_foreign_key "reviews", "rooms"
  add_foreign_key "reviews", "users"
  add_foreign_key "rooms", "users"
  add_foreign_key "tours", "users"
end
