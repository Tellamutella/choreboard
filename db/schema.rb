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

ActiveRecord::Schema.define(version: 2018_11_21_085219) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "children", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "point", default: 0
    t.index ["email"], name: "index_children_on_email", unique: true
    t.index ["parent_id"], name: "index_children_on_parent_id"
    t.index ["reset_password_token"], name: "index_children_on_reset_password_token", unique: true
  end

  create_table "parents", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_parents_on_email", unique: true
    t.index ["reset_password_token"], name: "index_parents_on_reset_password_token", unique: true
  end

  create_table "reward_requests", force: :cascade do |t|
    t.bigint "reward_id"
    t.integer "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "child_id"
    t.index ["child_id"], name: "index_reward_requests_on_child_id"
    t.index ["reward_id"], name: "index_reward_requests_on_reward_id"
  end

  create_table "rewards", force: :cascade do |t|
    t.bigint "parent_id"
    t.bigint "child_id"
    t.integer "price"
    t.string "name"
    t.text "details"
    t.boolean "daily", default: false
    t.boolean "claimed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id"], name: "index_rewards_on_child_id"
    t.index ["parent_id"], name: "index_rewards_on_parent_id"
  end

  create_table "task_submissions", force: :cascade do |t|
    t.bigint "task_id"
    t.text "comment"
    t.integer "state", default: 0
    t.bigint "reward_request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "child_id"
    t.string "photo"
    t.index ["child_id"], name: "index_task_submissions_on_child_id"
    t.index ["reward_request_id"], name: "index_task_submissions_on_reward_request_id"
    t.index ["task_id"], name: "index_task_submissions_on_task_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "parent_id"
    t.string "objective"
    t.text "key_results"
    t.bigint "child_id"
    t.boolean "mandatory", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["child_id"], name: "index_tasks_on_child_id"
    t.index ["parent_id"], name: "index_tasks_on_parent_id"
  end

  add_foreign_key "reward_requests", "children"
  add_foreign_key "reward_requests", "rewards"
  add_foreign_key "rewards", "children"
  add_foreign_key "rewards", "parents"
  add_foreign_key "task_submissions", "children"
  add_foreign_key "task_submissions", "reward_requests"
  add_foreign_key "task_submissions", "tasks"
  add_foreign_key "tasks", "children"
  add_foreign_key "tasks", "parents"
end
