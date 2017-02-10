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

ActiveRecord::Schema.define(version: 20170210224348) do

  create_table "locations", force: :cascade do |t|
    t.string   "country"
    t.string   "city"
    t.integer  "region"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organization_users", force: :cascade do |t|
    t.boolean  "admin"
    t.integer  "organizations_id"
    t.integer  "users_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["organizations_id"], name: "index_organization_users_on_organizations_id"
    t.index ["users_id"], name: "index_organization_users_on_users_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "address"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
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
    t.string   "address"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["organization_id"], name: "index_projects_on_organization_id"
  end

  create_table "user_project_payments", force: :cascade do |t|
    t.integer  "projects_id"
    t.integer  "users_id"
    t.integer  "payments_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["payments_id"], name: "index_user_project_payments_on_payments_id"
    t.index ["projects_id"], name: "index_user_project_payments_on_projects_id"
    t.index ["users_id"], name: "index_user_project_payments_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "provider"
    t.string   "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
