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

ActiveRecord::Schema[7.1].define(version: 0) do
    create_table "applicants", id: { type: :string, limit: 36 }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
      t.integer "reference_number", null: false
      t.string "firstname", null: false
      t.string "lastname", null: false
      t.string "email", null: false
      t.string "mobile", null: false
      t.integer "age", null: false
      t.string "city", null: false
      t.string "gender", null: false
      t.string "address", null: false
      t.integer "experience", null: false
      t.string "max_qualification", null: false
      t.string "skills", null: false
      t.integer "current_salary", null: false
      t.integer "expected_salary", null: false
      t.integer "shortlisted", limit: 1
      t.string "job_referal_code", null: false
      t.string "languages", null: false
      t.integer "cpa", null: false
      t.string "job_source_platform", null: false
      t.string "file"
      t.string "profile_photo"
      t.datetime "application_date", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.json "education"
      t.string "about_me"
      t.json "employment_history"
    end
  
    create_table "category", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
      t.string "title", null: false
      t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.index ["title"], name: "IDX_9f16dbbf263b0af0f03637fa7b", unique: true
    end
  
    create_table "companies", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
      t.string "name", null: false
      t.string "phone", null: false
      t.string "email", null: false
      t.string "website", null: false
      t.string "city"
      t.string "state"
      t.string "country"
      t.string "primary_industry", null: false
      t.integer "founded_in", null: false
      t.string "logo", null: false
      t.json "social_handles"
      t.integer "company_size", null: false
      t.string "description", limit: 1000
      t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.decimal "latitude", precision: 9, scale: 6
      t.decimal "longitude", precision: 9, scale: 6
      t.index ["name"], name: "IDX_3dacbb3eb4f095e29372ff8e13", unique: true
    end
  
    create_table "job", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
      t.integer "reference_number", null: false
      t.string "title", null: false
      t.string "city", null: false
      t.string "state", null: false
      t.integer "category_id"
      t.integer "company_id"
      t.text "emp_type", null: false
      t.string "date", null: false
      t.json "experience", null: false
      t.json "salary", null: false
      t.integer "cpa", null: false
      t.integer "verified", limit: 1, default: 0, null: false
      t.string "description", limit: 1000, null: false
      t.string "skills", limit: 1000, null: false
      t.string "critical_resp", limit: 1000, null: false
      t.string "qualification", limit: 1000, null: false
      t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.datetime "updated_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.string "updated_by"
      t.string "approved_by"
      t.datetime "approved_at", precision: nil
      t.string "allocated_to"
      t.index ["allocated_to"], name: "FK_fd15bc22008ce3fff7cbbdcf0e5"
      t.index ["category_id"], name: "FK_15f44c4b9fbb84e28a0346e930f"
      t.index ["company_id"], name: "FK_51cb12c924d3e8c7465cc8edff2"
      t.index ["reference_number"], name: "IDX_73eb63da5bd0fe1f83ab6fbe57", unique: true
    end
  
    create_table "job_allocations", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
      t.string "allocated_to", null: false
      t.string "allocated_by", null: false
      t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.text "reference_number", null: false
      t.string "userId", limit: 36
      t.index ["allocated_to"], name: "IDX_24f6034f9654f6f1133b2db91f", unique: true
      t.index ["userId"], name: "REL_d7171ec5a4f40d22dd9337f55c", unique: true
    end
  
    create_table "migrations", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
      t.bigint "timestamp", null: false
      t.string "name", null: false
    end
  
    create_table "permissions", id: { type: :string, limit: 36 }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
      t.string "permission", null: false
      t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.datetime "updated_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.string "roleId", limit: 36
      t.index ["roleId"], name: "FK_36d7b8e1a331102ec9161e879ce"
    end
  
    create_table "role", id: { type: :string, limit: 36 }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
      t.string "name", null: false
      t.string "code", null: false
      t.string "description", null: false
      t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.index ["code"], name: "IDX_ee999bb389d7ac0fd967172c41", unique: true
    end
  
    create_table "transaction", id: { type: :string, limit: 36 }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
      t.integer "redeemed_amount", null: false
      t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.string "user_id", null: false
      t.string "transaction_id", null: false
      t.integer "status", limit: 1
      t.string "approved_by"
      t.datetime "approved_at", precision: nil
      t.index ["user_id"], name: "FK_b4a3d92d5dde30f3ab5c34c5862"
    end
  
    create_table "user", id: { type: :string, limit: 36 }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
      t.string "firstname", null: false
      t.string "lastname", null: false
      t.string "email", null: false
      t.string "password", null: false
      t.string "role", null: false
      t.string "reset_link"
      t.datetime "logged_in_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.datetime "created_date", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.datetime "updated_date", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.text "categories"
      t.json "socialhandles"
      t.string "profile_photo"
      t.string "mobile"
      t.string "city"
      t.string "state"
      t.integer "jobAllocationsId"
      t.index ["email"], name: "IDX_e12875dfb3b1d92d7d7c5377e2", unique: true
      t.index ["jobAllocationsId"], name: "REL_c86a66fa8332c8d7eb52983f94", unique: true
    end
  
    create_table "user_fav_jobs", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
      t.string "user_id", null: false
      t.integer "referenceNumber", null: false
      t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    end
  
    create_table "user_referral_code", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
      t.string "user_id", null: false
      t.integer "job_reference_number", null: false
      t.string "referral_code", null: false
      t.integer "cpa", null: false
      t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    end
  
    create_table "users_cpa", id: { type: :string, limit: 36 }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
      t.integer "current_total_cpa", default: 0, null: false
      t.datetime "updated_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.string "userId", limit: 36
      t.index ["userId"], name: "FK_a904fb2854b42e8a4aac68faf7d"
    end
  
    add_foreign_key "job", "category", name: "FK_15f44c4b9fbb84e28a0346e930f"
    add_foreign_key "job", "companies", name: "FK_51cb12c924d3e8c7465cc8edff2"
    add_foreign_key "job", "user", column: "allocated_to", name: "FK_fd15bc22008ce3fff7cbbdcf0e5"
    add_foreign_key "job_allocations", "user", column: "userId", name: "FK_d7171ec5a4f40d22dd9337f55c0"
    add_foreign_key "permissions", "role", column: "roleId", name: "FK_36d7b8e1a331102ec9161e879ce"
    add_foreign_key "transaction", "user", name: "FK_b4a3d92d5dde30f3ab5c34c5862"
    add_foreign_key "user", "job_allocations", column: "jobAllocationsId", name: "FK_c86a66fa8332c8d7eb52983f94b"
    add_foreign_key "users_cpa", "user", column: "userId", name: "FK_a904fb2854b42e8a4aac68faf7d"
end
