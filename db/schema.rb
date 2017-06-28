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

ActiveRecord::Schema.define(version: 20170628100854) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "sidekiq_jobs", force: :cascade do |t|
    t.string   "jid"
    t.string   "queue"
    t.string   "class_name"
    t.text     "args"
    t.boolean  "retry"
    t.datetime "enqueued_at"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.string   "status"
    t.string   "name"
    t.text     "result"
    t.index ["class_name"], name: "index_sidekiq_jobs_on_class_name", using: :btree
    t.index ["enqueued_at"], name: "index_sidekiq_jobs_on_enqueued_at", using: :btree
    t.index ["finished_at"], name: "index_sidekiq_jobs_on_finished_at", using: :btree
    t.index ["jid"], name: "index_sidekiq_jobs_on_jid", using: :btree
    t.index ["queue"], name: "index_sidekiq_jobs_on_queue", using: :btree
    t.index ["retry"], name: "index_sidekiq_jobs_on_retry", using: :btree
    t.index ["started_at"], name: "index_sidekiq_jobs_on_started_at", using: :btree
    t.index ["status"], name: "index_sidekiq_jobs_on_status", using: :btree
  end

  create_table "transfer_attachments", force: :cascade do |t|
    t.integer  "transfer_id"
    t.string   "avatar"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "status",      default: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_transfer_attachments_on_deleted_at", using: :btree
  end

  create_table "transfers", force: :cascade do |t|
    t.string   "email_to",   default: "", null: false
    t.string   "email_from", default: "", null: false
    t.string   "message"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.datetime "deleted_on"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_transfers_on_deleted_at", using: :btree
  end

end