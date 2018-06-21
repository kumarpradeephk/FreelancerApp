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

ActiveRecord::Schema.define(version: 20180621063532) do

  create_table "applied_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "project_name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "project_id"
    t.bigint "applied_user_completion_detail_id"
    t.index ["applied_user_completion_detail_id"], name: "index_applied_details_on_applied_user_completion_detail_id"
    t.index ["project_id"], name: "index_applied_details_on_project_id"
    t.index ["user_id"], name: "index_applied_details_on_user_id"
  end

  create_table "applied_user_completion_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "start_date"
    t.integer "cost"
    t.integer "total_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "project_id"
    t.boolean "got_project", default: false
    t.boolean "is_rejected", default: false
    t.index ["project_id"], name: "index_applied_user_completion_details_on_project_id"
    t.index ["user_id"], name: "index_applied_user_completion_details_on_user_id"
  end

  create_table "project_skills_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "project_id"
    t.bigint "skills_category_id"
    t.index ["project_id"], name: "index_project_skills_categories_on_project_id"
    t.index ["skills_category_id"], name: "index_project_skills_categories_on_skills_category_id"
  end

  create_table "projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "project_name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.boolean "is_closed", default: false
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "skills_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "tech_skills"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category", limit: 3, default: 0, null: false
  end

  add_foreign_key "applied_details", "applied_user_completion_details"
  add_foreign_key "applied_details", "projects"
  add_foreign_key "applied_details", "users"
  add_foreign_key "applied_user_completion_details", "projects"
  add_foreign_key "applied_user_completion_details", "users"
  add_foreign_key "project_skills_categories", "projects"
  add_foreign_key "project_skills_categories", "skills_categories"
  add_foreign_key "projects", "users"
end
