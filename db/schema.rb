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

ActiveRecord::Schema.define(version: 2022_01_05_151533) do

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "contact"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "contact"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "item_inventories", force: :cascade do |t|
    t.integer "quantity", default: 0
    t.integer "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_item_inventories_on_product_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer "quantity", default: 0
    t.decimal "unit_per_cost", default: "0.0"
    t.integer "supply_deliver_id", null: false
    t.integer "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_items_on_product_id"
    t.index ["supply_deliver_id"], name: "index_items_on_supply_deliver_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sale_transactions", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_sale_transactions_on_customer_id"
  end

  create_table "sold_items", force: :cascade do |t|
    t.integer "quantity"
    t.decimal "price_per_unit"
    t.integer "sale_transaction_id", null: false
    t.integer "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_sold_items_on_product_id"
    t.index ["sale_transaction_id"], name: "index_sold_items_on_sale_transaction_id"
  end

  create_table "supply_delivers", force: :cascade do |t|
    t.integer "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "date", default: "2022-01-06"
    t.index ["company_id"], name: "index_supply_delivers_on_company_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "item_inventories", "products"
  add_foreign_key "items", "products"
  add_foreign_key "items", "supply_delivers"
  add_foreign_key "sale_transactions", "customers"
  add_foreign_key "sold_items", "products"
  add_foreign_key "sold_items", "sale_transactions"
  add_foreign_key "supply_delivers", "companies"
end
