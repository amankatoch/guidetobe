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

ActiveRecord::Schema.define(version: 20150220072148) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ad_requests", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "supplier_name"
    t.string   "email"
    t.string   "phone"
    t.string   "contact_preference"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ad_requests", ["category_id"], name: "index_ad_requests_on_category_id", using: :btree

  create_table "admins", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["username"], name: "index_admins_on_username", using: :btree

  create_table "advertisements", force: true do |t|
    t.string   "contact_name"
    t.string   "contact_email"
    t.integer  "region_id"
    t.integer  "category_id"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "image_url"
    t.string   "ad_type"
    t.boolean  "active",        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "advertisements", ["category_id"], name: "index_advertisements_on_category_id", using: :btree
  add_index "advertisements", ["region_id"], name: "index_advertisements_on_region_id", using: :btree

  create_table "brides", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "region"
    t.string   "postcode"
    t.string   "email"
    t.integer  "age"
    t.string   "source"
    t.date     "wedding_date"
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar"
    t.string   "wedding_place"
    t.datetime "last_login"
    t.string   "source_other"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  add_index "brides", ["email"], name: "index_brides_on_email", unique: true, using: :btree
  add_index "brides", ["username"], name: "index_brides_on_username", using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "categories", ["slug"], name: "index_categories_on_slug", unique: true, using: :btree

  create_table "city_requests", force: true do |t|
    t.string   "region"
    t.string   "email"
    t.date     "wedding_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flaggings", force: true do |t|
    t.string   "flaggable_type"
    t.integer  "flaggable_id"
    t.string   "flagger_type"
    t.integer  "flagger_id"
    t.text     "reason"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "flaggings", ["flaggable_type", "flaggable_id"], name: "index_flaggings_on_flaggable_type_and_flaggable_id", using: :btree
  add_index "flaggings", ["flagger_type", "flagger_id", "flaggable_type", "flaggable_id"], name: "access_flaggings", using: :btree

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "images", force: true do |t|
    t.integer  "supplier_id"
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoices", force: true do |t|
    t.date     "date"
    t.string   "reference"
    t.string   "email"
    t.integer  "advertisement_id"
    t.decimal  "amount",           precision: 8, scale: 2
    t.boolean  "paid",                                     default: false
    t.string   "stripe_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invoices", ["advertisement_id"], name: "index_invoices_on_advertisement_id", using: :btree

  create_table "owners", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.integer  "supplier_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "product_id"
    t.string   "email"
    t.datetime "last_login"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "source"
    t.string   "source_other"
  end

  add_index "owners", ["product_id"], name: "index_owners_on_product_id", using: :btree
  add_index "owners", ["supplier_id"], name: "index_owners_on_supplier_id", using: :btree
  add_index "owners", ["username"], name: "index_owners_on_username", using: :btree

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "author"
    t.date     "published_on"
    t.boolean  "visible",      default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "image"
  end

  add_index "posts", ["slug"], name: "index_posts_on_slug", unique: true, using: :btree

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "year_price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "package"
  end

  create_table "regions", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "regions", ["slug"], name: "index_regions_on_slug", unique: true, using: :btree

  create_table "replies", force: true do |t|
    t.text     "body"
    t.integer  "review_id"
    t.integer  "owner_id"
    t.boolean  "hidden"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "replies", ["owner_id"], name: "index_replies_on_owner_id", using: :btree
  add_index "replies", ["review_id"], name: "index_replies_on_review_id", using: :btree

  create_table "reports", force: true do |t|
    t.integer  "review_id"
    t.integer  "reportable_id"
    t.string   "reportable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reports", ["reportable_id", "reportable_type"], name: "index_reports_on_reportable_id_and_reportable_type", using: :btree
  add_index "reports", ["review_id"], name: "index_reports_on_review_id", using: :btree

  create_table "reviews", force: true do |t|
    t.text     "general_content"
    t.text     "like_content"
    t.text     "unlike_content"
    t.text     "insider_tip"
    t.integer  "service"
    t.integer  "price"
    t.integer  "overall"
    t.integer  "supplier_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bride_id"
    t.boolean  "hidden",          default: false
    t.string   "image_one_url"
    t.string   "image_two_url"
    t.string   "image_three_url"
  end

  add_index "reviews", ["bride_id"], name: "index_reviews_on_bride_id", using: :btree
  add_index "reviews", ["supplier_id"], name: "index_reviews_on_supplier_id", using: :btree

  create_table "sales", force: true do |t|
    t.string   "email"
    t.string   "guid"
    t.integer  "owner_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
    t.string   "stripe_id"
    t.string   "stripe_token"
    t.date     "card_expiration"
    t.text     "error"
    t.integer  "fee_amount"
  end

  add_index "sales", ["owner_id"], name: "index_sales_on_owner_id", using: :btree
  add_index "sales", ["product_id"], name: "index_sales_on_product_id", using: :btree

  create_table "search_suggestions", force: true do |t|
    t.string   "term"
    t.integer  "popularity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stripe_events", force: true do |t|
    t.string   "stripe_id"
    t.string   "stripe_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscriptions", force: true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "owner_id"
    t.integer  "sale_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscriptions", ["owner_id"], name: "index_subscriptions_on_owner_id", using: :btree
  add_index "subscriptions", ["product_id"], name: "index_subscriptions_on_product_id", using: :btree
  add_index "subscriptions", ["sale_id"], name: "index_subscriptions_on_sale_id", using: :btree

  create_table "suppliers", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "website"
    t.integer  "region_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "rating",          default: 0.0
    t.text     "address"
    t.string   "facebook_url"
    t.string   "twitter_url"
    t.string   "google_url"
    t.string   "video_url"
    t.string   "slug"
    t.string   "logo_url"
    t.string   "image_one_url"
    t.string   "image_two_url"
    t.string   "image_three_url"
    t.string   "image_four_url"
    t.text     "description"
    t.integer  "reviews_count",   default: 0,   null: false
    t.string   "source"
    t.string   "source_other"
  end

  add_index "suppliers", ["category_id"], name: "index_suppliers_on_category_id", using: :btree
  add_index "suppliers", ["region_id"], name: "index_suppliers_on_region_id", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taggings", ["post_id"], name: "index_taggings_on_post_id", using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "versions", force: true do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.text     "object_changes"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
