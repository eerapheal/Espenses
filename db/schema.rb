# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_01_011257) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.bigint "author_id", null: false
    t.string "name"
    t.decimal "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_categories_on_author_id"
  end

  create_table "category_expenses", force: :cascade do |t|
    t.bigint "expense_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_category_expenses_on_category_id"
    t.index ["expense_id"], name: "index_category_expenses_on_expense_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.bigint "author_id", null: false
    t.string "name"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_expenses_on_author_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "categories", "users", column: "author_id"
  add_foreign_key "category_expenses", "categories"
  add_foreign_key "category_expenses", "expenses"
  add_foreign_key "expenses", "users", column: "author_id"
end
