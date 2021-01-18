# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_18_162918) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "images", force: :cascade do |t|
    t.bigint "listing_id"
    t.float "etsy_image_id"
    t.string "url_full"
    t.string "url_570_n"
    t.string "url_75_75"
    t.string "url_170_135"
    t.string "hex_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["listing_id"], name: "index_images_on_listing_id"
  end

  create_table "listing_tags", force: :cascade do |t|
    t.bigint "tag_id"
    t.bigint "listing_id"
    t.index ["listing_id", "tag_id"], name: "index_listing_tags_on_listing_id_and_tag_id"
    t.index ["listing_id"], name: "index_listing_tags_on_listing_id"
    t.index ["tag_id"], name: "index_listing_tags_on_tag_id"
  end

  create_table "listings", force: :cascade do |t|
    t.integer "etsy_id", null: false
    t.string "state", default: "active"
    t.integer "etsy_user_id"
    t.string "title"
    t.text "description"
    t.float "price"
    t.string "unit"
    t.integer "quantity"
    t.integer "taxonomy_id"
    t.integer "suggested_taxonomy_id"
    t.string "materials", default: [], array: true
    t.integer "shop_section_id"
    t.integer "featured_rank"
    t.string "url"
    t.integer "views"
    t.integer "num_favorers"
    t.integer "processing_min"
    t.integer "processing_max"
    t.string "who_made"
    t.boolean "is_supply"
    t.string "when_made"
    t.integer "item_weight"
    t.string "item_weight_unit"
    t.integer "item_length"
    t.integer "item_width"
    t.integer "item_height"
    t.string "item_dimensions_unit"
    t.boolean "is_private", default: false
    t.string "recipient"
    t.string "occasion"
    t.string "style", default: [], array: true
    t.boolean "non_taxable"
    t.boolean "is_customizable"
    t.boolean "is_digital"
    t.string "file_data"
    t.boolean "has_variations"
    t.string "language"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "shop_id"
    t.datetime "creation_datetime"
    t.datetime "state_datetime"
    t.integer "sales_count", default: 0
    t.index ["creation_datetime"], name: "index_listings_on_creation_datetime"
    t.index ["shop_id"], name: "index_listings_on_shop_id"
    t.index ["state"], name: "index_listings_on_state"
    t.index ["views"], name: "index_listings_on_views"
  end

  create_table "sales_counts", force: :cascade do |t|
    t.bigint "listing_id", null: false
    t.integer "count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["listing_id"], name: "index_sales_counts_on_listing_id"
  end

  create_table "shops", force: :cascade do |t|
    t.integer "etsy_id"
    t.string "name"
    t.string "title"
    t.string "announcement"
    t.string "currency_unit"
    t.string "url"
    t.string "image_url"
    t.integer "num_favorers"
    t.string "languages", default: [], array: true
    t.string "icon_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "creation_datetime"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "views_counts", force: :cascade do |t|
    t.integer "count"
    t.bigint "listing_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["listing_id"], name: "index_views_counts_on_listing_id"
  end

  add_foreign_key "listings", "shops"
end
