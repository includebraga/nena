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

ActiveRecord::Schema.define(version: 20170211150204) do

  create_table "locations", force: :cascade do |t|
    t.string   "city"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "organization_users", force: :cascade do |t|
    t.boolean  "admin"
    t.integer  "organization_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["organization_id"], name: "index_organization_users_on_organization_id"
    t.index ["user_id"], name: "index_organization_users_on_user_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "address"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "hero_file_name"
    t.string   "hero_content_type"
    t.integer  "hero_file_size"
    t.datetime "hero_updated_at"
  end

  create_table "payments", force: :cascade do |t|
    t.string   "type"
    t.float    "quantity"
    t.string   "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "organization_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.datetime "initial_date"
    t.datetime "final_date"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "location_id"
    t.string   "tagline"
    t.string   "hero_file_name"
    t.string   "hero_content_type"
    t.integer  "hero_file_size"
    t.datetime "hero_updated_at"
    t.index ["location_id"], name: "index_projects_on_location_id"
    t.index ["organization_id"], name: "index_projects_on_organization_id"
  end

  create_table "user_project_payments", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.integer  "payments_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["payments_id"], name: "index_user_project_payments_on_payments_id"
    t.index ["project_id"], name: "index_user_project_payments_on_project_id"
    t.index ["user_id"], name: "index_user_project_payments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.integer  "location_id"
    t.index ["location_id"], name: "index_users_on_location_id"
  end

end
