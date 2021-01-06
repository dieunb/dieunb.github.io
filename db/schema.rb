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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", primary_key: "category_id", id: :integer, limit: 2, default: nil, force: :cascade do |t|
    t.string "category_name", limit: 15, null: false
    t.text "description"
    t.binary "picture"
  end

  create_table "customer_customer_demo", primary_key: ["customer_id", "customer_type_id"], force: :cascade do |t|
    t.string "customer_id", null: false
    t.string "customer_type_id", null: false
  end

  create_table "customer_demographics", primary_key: "customer_type_id", id: :string, force: :cascade do |t|
    t.text "customer_desc"
  end

  create_table "customers", primary_key: "customer_id", id: :string, force: :cascade do |t|
    t.string "company_name", limit: 40, null: false
    t.string "contact_name", limit: 30
    t.string "contact_title", limit: 30
    t.string "address", limit: 60
    t.string "city", limit: 15
    t.string "region", limit: 15
    t.string "postal_code", limit: 10
    t.string "country", limit: 15
    t.string "phone", limit: 24
    t.string "fax", limit: 24
  end

  create_table "employee_territories", primary_key: ["employee_id", "territory_id"], force: :cascade do |t|
    t.integer "employee_id", limit: 2, null: false
    t.string "territory_id", limit: 20, null: false
  end

  create_table "employees", primary_key: "employee_id", id: :integer, limit: 2, default: nil, force: :cascade do |t|
    t.string "last_name", limit: 20, null: false
    t.string "first_name", limit: 10, null: false
    t.string "title", limit: 30
    t.string "title_of_courtesy", limit: 25
    t.date "birth_date"
    t.date "hire_date"
    t.string "address", limit: 60
    t.string "city", limit: 15
    t.string "region", limit: 15
    t.string "postal_code", limit: 10
    t.string "country", limit: 15
    t.string "home_phone", limit: 24
    t.string "extension", limit: 4
    t.binary "photo"
    t.text "notes"
    t.integer "reports_to", limit: 2
    t.string "photo_path", limit: 255
  end

  create_table "order_details", primary_key: ["order_id", "product_id"], force: :cascade do |t|
    t.integer "order_id", limit: 2, null: false
    t.integer "product_id", limit: 2, null: false
    t.float "unit_price", null: false
    t.integer "quantity", limit: 2, null: false
    t.float "discount", null: false
  end

  create_table "orders", primary_key: "order_id", id: :integer, limit: 2, default: nil, force: :cascade do |t|
    t.string "customer_id"
    t.integer "employee_id", limit: 2
    t.date "order_date"
    t.date "required_date"
    t.date "shipped_date"
    t.integer "ship_via", limit: 2
    t.float "freight"
    t.string "ship_name", limit: 40
    t.string "ship_address", limit: 60
    t.string "ship_city", limit: 15
    t.string "ship_region", limit: 15
    t.string "ship_postal_code", limit: 10
    t.string "ship_country", limit: 15
  end

  create_table "products", primary_key: "product_id", id: :integer, limit: 2, default: nil, force: :cascade do |t|
    t.string "product_name", limit: 40, null: false
    t.integer "supplier_id", limit: 2
    t.integer "category_id", limit: 2
    t.string "quantity_per_unit", limit: 20
    t.float "unit_price"
    t.integer "units_in_stock", limit: 2
    t.integer "units_on_order", limit: 2
    t.integer "reorder_level", limit: 2
    t.integer "discontinued", null: false
  end

  create_table "region", primary_key: "region_id", id: :integer, limit: 2, default: nil, force: :cascade do |t|
    t.string "region_description", null: false
  end

  create_table "shippers", primary_key: "shipper_id", id: :integer, limit: 2, default: nil, force: :cascade do |t|
    t.string "company_name", limit: 40, null: false
    t.string "phone", limit: 24
  end

  create_table "suppliers", primary_key: "supplier_id", id: :integer, limit: 2, default: nil, force: :cascade do |t|
    t.string "company_name", limit: 40, null: false
    t.string "contact_name", limit: 30
    t.string "contact_title", limit: 30
    t.string "address", limit: 60
    t.string "city", limit: 15
    t.string "region", limit: 15
    t.string "postal_code", limit: 10
    t.string "country", limit: 15
    t.string "phone", limit: 24
    t.string "fax", limit: 24
    t.text "homepage"
  end

  create_table "territories", primary_key: "territory_id", id: :string, limit: 20, force: :cascade do |t|
    t.string "territory_description", null: false
    t.integer "region_id", limit: 2, null: false
  end

  create_table "us_states", primary_key: "state_id", id: :integer, limit: 2, default: nil, force: :cascade do |t|
    t.string "state_name", limit: 100
    t.string "state_abbr", limit: 2
    t.string "state_region", limit: 50
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "customer_customer_demo", "customer_demographics", column: "customer_type_id", primary_key: "customer_type_id", name: "fk_customer_customer_demo_customer_demographics"
  add_foreign_key "customer_customer_demo", "customers", primary_key: "customer_id", name: "fk_customer_customer_demo_customers"
  add_foreign_key "employee_territories", "employees", primary_key: "employee_id", name: "fk_employee_territories_employees"
  add_foreign_key "employee_territories", "territories", primary_key: "territory_id", name: "fk_employee_territories_territories"
  add_foreign_key "employees", "employees", column: "reports_to", primary_key: "employee_id", name: "fk_employees_employees"
  add_foreign_key "order_details", "orders", primary_key: "order_id", name: "fk_order_details_orders"
  add_foreign_key "order_details", "products", primary_key: "product_id", name: "fk_order_details_products"
  add_foreign_key "orders", "customers", primary_key: "customer_id", name: "fk_orders_customers"
  add_foreign_key "orders", "employees", primary_key: "employee_id", name: "fk_orders_employees"
  add_foreign_key "orders", "shippers", column: "ship_via", primary_key: "shipper_id", name: "fk_orders_shippers"
  add_foreign_key "products", "categories", primary_key: "category_id", name: "fk_products_categories"
  add_foreign_key "products", "suppliers", primary_key: "supplier_id", name: "fk_products_suppliers"
  add_foreign_key "territories", "region", primary_key: "region_id", name: "fk_territories_region"
end
