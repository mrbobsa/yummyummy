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

ActiveRecord::Schema.define(version: 20150826054404) do

  create_table "bigrecipes", force: :cascade do |t|
    t.string   "bigrecipe_category"
    t.string   "bigrecipe_image"
    t.string   "bigrecipe_name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "detailrecipes", force: :cascade do |t|
    t.integer  "smallrecipe_id"
    t.string   "detailrecipe_image"
    t.text     "detailrecipe_content"
    t.string   "detailrecipe_voice"
    t.integer  "tip_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "dusers", force: :cascade do |t|
    t.string   "email",                   default: "", null: false
    t.string   "encrypted_password",      default: "", null: false
    t.string   "user_favorite"
    t.string   "user_nickname"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "user_image_file_name"
    t.string   "user_image_content_type"
    t.integer  "user_image_file_size"
    t.datetime "user_image_updated_at"
  end

  add_index "dusers", ["email"], name: "index_dusers_on_email", unique: true
  add_index "dusers", ["reset_password_token"], name: "index_dusers_on_reset_password_token", unique: true

  create_table "materials", force: :cascade do |t|
    t.string   "material_code"
    t.string   "material_normal"
    t.string   "material_perished"
    t.string   "material_gray"
    t.string   "material_name"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "pridereplies", force: :cascade do |t|
    t.integer  "pride_id"
    t.string   "pridereply_email"
    t.string   "pridereply_content"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "prides", force: :cascade do |t|
    t.string   "pride_email"
    t.string   "pride_image"
    t.string   "pride_title"
    t.string   "pride_content"
    t.integer  "pride_heart"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "questreplies", force: :cascade do |t|
    t.integer  "quest_id"
    t.string   "questreply_email"
    t.string   "questreply_content"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "quests", force: :cascade do |t|
    t.string   "quest_email"
    t.string   "quest_image"
    t.string   "quest_title"
    t.string   "quest_content"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "recipecolds", force: :cascade do |t|
    t.string   "recipecold_material"
    t.boolean  "recipecold_trait"
    t.integer  "smallrecipe_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "smallrecipes", force: :cascade do |t|
    t.integer  "bigrecipe_id"
    t.string   "smallrecipe_name"
    t.string   "smallrecipe_image"
    t.integer  "smallrecipe_heart"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "smallreplies", force: :cascade do |t|
    t.integer  "smallrecipe_id"
    t.string   "smallreply_email"
    t.text     "smallreply_content"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "smallreres", force: :cascade do |t|
    t.integer  "smallreply_id"
    t.string   "smallrere_email"
    t.string   "smallrere_content"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "tips", force: :cascade do |t|
    t.string   "tip_image"
    t.text     "tip_content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tutors", force: :cascade do |t|
    t.string   "tutor_name"
    t.string   "tutor_image"
    t.text     "tutor_content"
    t.string   "tutor_link"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
