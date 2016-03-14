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

ActiveRecord::Schema.define(version: 20160313141724) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "annontations", force: :cascade do |t|
    t.integer  "annotated_id"
    t.string   "annotated_type"
    t.string   "note"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "annontations", ["annotated_id", "annotated_type"], name: "index_annontations_on_annotated_id_and_annotated_type", using: :btree
  add_index "annontations", ["annotated_type", "annotated_id"], name: "index_annontations_on_annotated_type_and_annotated_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "name"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "products", ["company_id"], name: "index_products_on_company_id", using: :btree

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

end
