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

ActiveRecord::Schema.define(version: 20141021184914) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "accounts", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "name"
    t.uuid     "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "agenda_items", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.datetime "ends_at"
    t.datetime "starts_at"
    t.boolean  "completed"
    t.boolean  "trashed"
    t.text     "description"
    t.float    "position"
    t.string   "presenter"
    t.text     "name"
    t.uuid     "meeting_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devices", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "device_type"
    t.string   "device_token"
    t.uuid     "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "name"
    t.uuid     "account_id"
    t.uuid     "creator_id"
    t.uuid     "parent_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "name"
    t.text     "address_1"
    t.text     "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.uuid     "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meetings", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.text     "name"
    t.text     "description"
    t.boolean  "trashed"
    t.boolean  "template"
    t.boolean  "draft"
    t.boolean  "archived"
    t.boolean  "completed"
    t.text     "privacy"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.boolean  "all_day"
    t.uuid     "creator_id"
    t.uuid     "account_id"
    t.uuid     "location_id"
    t.text     "location_comments"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participants", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.uuid     "meeting_id"
    t.uuid     "user_id"
    t.boolean  "attended"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "planned_start"
    t.datetime "planned_end"
    t.boolean  "trashed"
    t.float    "position"
    t.uuid     "meeting_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
    t.string   "authentication_token"
    t.string   "name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "description"
    t.integer  "role"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.uuid     "invited_by_id"
    t.integer  "invitations_count",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

end
