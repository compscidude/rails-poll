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

ActiveRecord::Schema.define(version: 20170417091004) do

  create_table "poll_answers", force: :cascade do |t|
    t.string   "answer"
    t.integer  "poll_id"
    t.integer  "vote_count", default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["poll_id"], name: "index_poll_answers_on_poll_id"
  end

  create_table "poll_participations", force: :cascade do |t|
    t.integer  "poll_answer_id"
    t.integer  "author_id"
    t.integer  "poll_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["author_id"], name: "index_poll_participations_on_author_id"
    t.index ["poll_answer_id"], name: "index_poll_participations_on_poll_answer_id"
    t.index ["poll_id"], name: "index_poll_participations_on_poll_id"
    t.index ["user_id"], name: "index_poll_participations_on_user_id"
  end

  create_table "polls", force: :cascade do |t|
    t.integer  "author_id"
    t.string   "question"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_polls_on_author_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
