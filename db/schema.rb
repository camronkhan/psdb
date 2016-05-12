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

ActiveRecord::Schema.define(version: 20160404172305) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "website_url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "companies", ["name"], name: "index_companies_on_name", unique: true, using: :btree

  create_table "notes", force: :cascade do |t|
    t.integer  "annotatable_id"
    t.string   "annotatable_type"
    t.text     "data"
    t.integer  "position"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "notes", ["annotatable_type", "annotatable_id"], name: "index_notes_on_annotatable_type_and_annotatable_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "name"
    t.string   "image_url"
    t.string   "tags"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "products", ["company_id"], name: "index_products_on_company_id", using: :btree
  add_index "products", ["name", "company_id"], name: "index_products_on_name_and_company_id", unique: true, using: :btree

  create_table "servicer_assignments", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "servicer_id"
    t.string   "condition"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "servicer_assignments", ["product_id", "servicer_id"], name: "servicer_assignments_index", using: :btree

  create_table "servicers", force: :cascade do |t|
    t.string   "name"
    t.string   "internal_phone"
    t.string   "external_phone"
    t.string   "address"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "servicers", ["name"], name: "index_servicers_on_name", unique: true, using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "technologist_assignments", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "technologist_id"
    t.string   "condition"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "technologist_assignments", ["product_id", "technologist_id"], name: "technologist_assignments_index", using: :btree

  create_table "technologists", force: :cascade do |t|
    t.string   "name"
    t.string   "internal_phone"
    t.string   "external_phone"
    t.string   "hours"
    t.string   "escalation"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "technologists", ["name"], name: "index_technologists_on_name", unique: true, using: :btree

end
