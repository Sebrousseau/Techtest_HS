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

ActiveRecord::Schema.define(version: 2022_02_14_122842) do

  create_table "invoices", force: :cascade do |t|
    t.integer "order_id", null: false
    t.float "total_ht"
    t.float "total_ttc"
    t.date "payment_date"
    t.string "customer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_invoices_on_order_id"
  end

  create_table "order_products", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "product_id", null: false
    t.float "total_price_ht"
    t.float "total_price_ttc"
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_order_products_on_order_id"
    t.index ["product_id"], name: "index_order_products_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.float "total_ht"
    t.float "total_ttc"
    t.string "status", default: "À faire"
    t.string "customer"
    t.boolean "apply_tva", default: false
    t.date "payment_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.float "unit_price_ht"
    t.float "tva"
    t.string "img"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "invoices", "orders"
  add_foreign_key "order_products", "orders"
  add_foreign_key "order_products", "products"
end
