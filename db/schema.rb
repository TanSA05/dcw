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

ActiveRecord::Schema.define(version: 20160106180940) do

  create_table "complaints", force: :cascade do |t|
    t.string   "complainant",                   limit: 255
    t.string   "address",                       limit: 255
    t.string   "complaint_number",              limit: 255
    t.date     "final_target_date"
    t.string   "file",                          limit: 255
    t.string   "status",                        limit: 255
    t.text     "prayers",                       limit: 65535
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "category",                      limit: 255
    t.string   "respondent_if_person",          limit: 255
    t.string   "respondent_if_agency",          limit: 255
    t.text     "brief_of_complaint",            limit: 65535
    t.string   "contact_number_of_complainant", limit: 255
    t.string   "locality",                      limit: 255
    t.date     "next_target_date"
    t.integer  "organization_id",               limit: 4
    t.text     "final_remarks",                 limit: 65535
  end

  add_index "complaints", ["organization_id"], name: "index_complaints_on_organization_id", using: :btree

  create_table "forwards", force: :cascade do |t|
    t.integer  "complaint_id",         limit: 4
    t.integer  "organization_id",      limit: 4
    t.string   "reply_attachment",     limit: 255
    t.text     "interim_remarks",      limit: 65535
    t.text     "final_remarks",        limit: 65535
    t.text     "feedback_agency",      limit: 65535
    t.text     "feedback_dcw",         limit: 65535
    t.text     "call_center_feedback", limit: 65535
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "forwards", ["complaint_id"], name: "index_forwards_on_complaint_id", using: :btree
  add_index "forwards", ["organization_id"], name: "index_forwards_on_organization_id", using: :btree

  create_table "hearings", force: :cascade do |t|
    t.integer  "complaint_id",                  limit: 4
    t.boolean  "complainant_present"
    t.string   "other_summoned",                limit: 255
    t.boolean  "other_present"
    t.text     "remarks",                       limit: 65535
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.date     "date"
    t.boolean  "respondent_summoned_if_person"
    t.boolean  "respondent_summoned_if_agency"
    t.boolean  "respondent_present_if_person"
    t.boolean  "respondent_present_if_agency"
    t.boolean  "complainant_called"
  end

  add_index "hearings", ["complaint_id"], name: "index_hearings_on_complaint_id", using: :btree

  create_table "organizations", force: :cascade do |t|
    t.string   "name",                    limit: 255
    t.integer  "category",                limit: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "days_for_final_response", limit: 4
  end

  create_table "police", force: :cascade do |t|
    t.integer  "complaint_id",          limit: 4
    t.text     "status_report",         limit: 65535
    t.string   "file",                  limit: 255
    t.date     "date_asking_sr"
    t.date     "date_target_sr"
    t.date     "date_sr_filled"
    t.text     "summons",               limit: 65535
    t.boolean  "fir_status"
    t.string   "fir_number",            limit: 255
    t.string   "investigation_process", limit: 255
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.date     "fir_date"
  end

  add_index "police", ["complaint_id"], name: "index_police_on_complaint_id", using: :btree

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
    t.string   "name",                   limit: 255
    t.integer  "role",                   limit: 4
    t.integer  "organization_id",        limit: 4
    t.string   "phone",                  limit: 255
    t.string   "designation",            limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["organization_id"], name: "index_users_on_organization_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "version_associations", force: :cascade do |t|
    t.integer "version_id",       limit: 4
    t.string  "foreign_key_name", limit: 255, null: false
    t.integer "foreign_key_id",   limit: 4
  end

  add_index "version_associations", ["foreign_key_name", "foreign_key_id"], name: "index_version_associations_on_foreign_key", using: :btree
  add_index "version_associations", ["version_id"], name: "index_version_associations_on_version_id", using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",      limit: 255,        null: false
    t.integer  "item_id",        limit: 4,          null: false
    t.string   "event",          limit: 255,        null: false
    t.string   "whodunnit",      limit: 255
    t.text     "object",         limit: 4294967295
    t.datetime "created_at"
    t.text     "object_changes", limit: 4294967295
    t.integer  "transaction_id", limit: 4
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
  add_index "versions", ["transaction_id"], name: "index_versions_on_transaction_id", using: :btree

  add_foreign_key "complaints", "organizations"
  add_foreign_key "forwards", "complaints"
  add_foreign_key "forwards", "organizations"
  add_foreign_key "hearings", "complaints"
  add_foreign_key "police", "complaints"
  add_foreign_key "users", "organizations"
end
