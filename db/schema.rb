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

ActiveRecord::Schema.define(version: 20150826030802) do

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
    t.string   "pride_email"
    t.string   "pride_content"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
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

  create_table "users", force: :cascade do |t|
    t.string   "user_email"
    t.string   "user_password"
    t.string   "user_favorite"
    t.string   "user_image"
    t.string   "user_nickname"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
