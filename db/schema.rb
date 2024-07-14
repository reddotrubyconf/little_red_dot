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

ActiveRecord::Schema[7.0].define(version: 2024_06_11_123126) do
  create_table "conferences", id: :string, force: :cascade do |t|
    t.string "name", null: false
    t.string "address"
    t.datetime "start_date"
    t.datetime "end_date"
    t.json "agenda", default: {}
    t.boolean "active", default: false
    t.boolean "call_for_papers", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sponsorship_prospectus"
  end

  create_table "featured_speakers", force: :cascade do |t|
    t.string "display_picture", null: false
    t.string "name", null: false
    t.string "title", null: false
    t.string "github_handle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "bio"
    t.string "presentation_title"
  end

  create_table "incoming_webhooks", id: :string, force: :cascade do |t|
    t.string "source"
    t.string "event_name"
    t.json "payload"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "papers", id: :string, force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.text "notes"
    t.string "audience_level", null: false
    t.string "status"
    t.string "user_id", null: false
    t.string "conference_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conference_id"], name: "index_papers_on_conference_id"
    t.index ["user_id"], name: "index_papers_on_user_id"
  end

  create_table "speaker_profiles", id: :string, force: :cascade do |t|
    t.string "name", null: false
    t.string "url"
    t.string "affiliation"
    t.text "bio"
    t.string "x_handle"
    t.string "paper_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["paper_id"], name: "index_speaker_profiles_on_paper_id"
  end

  create_table "subscribers", id: :string, force: :cascade do |t|
    t.string "email", null: false
    t.string "conference_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conference_id"], name: "index_subscribers_on_conference_id"
  end

  create_table "users", id: :string, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "source_id"
    t.string "provider"
    t.json "data", default: {}
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["source_id"], name: "index_users_on_source_id", unique: true
  end

  create_table "webhooks", force: :cascade do |t|
    t.string "source"
    t.string "event_name"
    t.json "payload"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "papers", "conferences"
  add_foreign_key "papers", "users"
  add_foreign_key "speaker_profiles", "papers"
  add_foreign_key "subscribers", "conferences"
end
