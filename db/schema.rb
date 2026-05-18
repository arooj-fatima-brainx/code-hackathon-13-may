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

ActiveRecord::Schema[8.1].define(version: 2026_05_18_085643) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "briefs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "raw_text"
    t.string "status"
    t.jsonb "structured_data"
    t.datetime "updated_at", null: false
  end

  create_table "jira_tickets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "jira_id"
    t.string "status"
    t.bigint "task_id", null: false
    t.datetime "updated_at", null: false
    t.string "url"
    t.index ["task_id"], name: "index_jira_tickets_on_task_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "brief_id", null: false
    t.datetime "created_at", null: false
    t.text "description"
    t.string "status"
    t.datetime "updated_at", null: false
    t.index ["brief_id"], name: "index_tasks_on_brief_id"
  end

  add_foreign_key "jira_tickets", "tasks"
  add_foreign_key "tasks", "briefs"
end
