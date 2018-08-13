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

ActiveRecord::Schema.define(version: 2018_08_13_072354) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "picture_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["picture_id"], name: "index_comments_on_picture_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.string "street_name"
    t.string "title"
    t.string "artist"
    t.text "img_url"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pictures_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users_pictures", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "picture_id"
    t.boolean "visited"
    t.boolean "isfav"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["picture_id"], name: "index_users_pictures_on_picture_id"
    t.index ["user_id"], name: "index_users_pictures_on_user_id"
  end

  add_foreign_key "comments", "pictures"
  add_foreign_key "comments", "users"
  add_foreign_key "pictures", "users"
  add_foreign_key "users_pictures", "pictures"
  add_foreign_key "users_pictures", "users"
end
