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

ActiveRecord::Schema.define(version: 20190931195028) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "images", force: :cascade do |t|
    t.string   "handle"
    t.string   "url"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_images_on_product_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "handleBundle"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "category"
    t.string   "handle"
    t.string   "fullUrl"
    t.string   "cropX"
    t.string   "cropY"
    t.string   "cropH"
    t.string   "cropW"
    t.string   "rotate"
    t.boolean  "isTranscribed", default: false
    t.string   "transcription"
    t.integer  "product_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "image_id"
    t.string   "visionResult"
    t.boolean  "isVisionTrue"
    t.index ["product_id"], name: "index_tags_on_product_id", using: :btree
  end

  add_foreign_key "images", "products"
  add_foreign_key "tags", "products"
end
