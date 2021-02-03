# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_03_021744) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "shop_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_id"], name: "index_bookmarks_on_shop_id"
    t.index ["user_id", "shop_id"], name: "index_bookmarks_on_user_id_and_shop_id", unique: true
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.index ["name"], name: "index_categories_on_name"
  end

  create_table "images", force: :cascade do |t|
    t.bigint "shop_id"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_id"], name: "index_images_on_shop_id"
  end

  create_table "media", force: :cascade do |t|
    t.bigint "shop_id", null: false
    t.string "home_page"
    t.string "facebook"
    t.string "twitter"
    t.string "instagram"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_id"], name: "index_media_on_shop_id"
  end

  create_table "pay_cards", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "purposes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.float "score", null: false
    t.bigint "user_id"
    t.bigint "shop_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_id"], name: "index_reviews_on_shop_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "shop_cards", force: :cascade do |t|
    t.bigint "shop_id", null: false
    t.bigint "pay_card_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pay_card_id"], name: "index_shop_cards_on_pay_card_id"
    t.index ["shop_id"], name: "index_shop_cards_on_shop_id"
  end

  create_table "shop_categories", force: :cascade do |t|
    t.bigint "shop_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_shop_categories_on_category_id"
    t.index ["shop_id", "category_id"], name: "index_shop_categories_on_shop_id_and_category_id", unique: true
    t.index ["shop_id"], name: "index_shop_categories_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone_number"
    t.text "content"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "address_building"
    t.bigint "area_id"
    t.float "latitude"
    t.float "longitude"
    t.boolean "booking", default: false, null: false
    t.string "holidays"
    t.string "budget"
    t.string "b_hours_first"
    t.string "b_hours_last"
    t.index ["area_id"], name: "index_shops_on_area_id"
    t.index ["name"], name: "index_shops_on_name"
    t.index ["user_id"], name: "index_shops_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "image"
    t.string "remember_digest"
    t.boolean "admin", default: false, null: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "bookmarks", "shops"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "images", "shops"
  add_foreign_key "media", "shops"
  add_foreign_key "reviews", "shops"
  add_foreign_key "reviews", "users"
  add_foreign_key "shop_cards", "pay_cards"
  add_foreign_key "shop_cards", "shops"
  add_foreign_key "shop_categories", "categories"
  add_foreign_key "shop_categories", "shops"
  add_foreign_key "shops", "areas"
  add_foreign_key "shops", "users"
end
