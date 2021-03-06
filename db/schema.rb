# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160525043733) do

  create_table "game_questions", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "question_id"
    t.integer  "status",      default: 0
    t.datetime "start_time"
    t.index ["game_id"], name: "index_game_questions_on_game_id"
    t.index ["question_id"], name: "index_game_questions_on_question_id"
  end

  create_table "games", force: :cascade do |t|
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "owner_id"
    t.integer  "status",       default: 0
    t.integer  "keep_private", default: 0
  end

  create_table "players", force: :cascade do |t|
    t.integer "user_id"
    t.integer "game_id"
    t.boolean "winner",  default: false
    t.index ["game_id"], name: "index_players_on_game_id"
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text     "question"
    t.text     "answer"
    t.text     "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "choice1"
    t.string   "choice2"
    t.string   "choice3"
  end

  create_table "user_answers", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "answer"
    t.boolean  "correct"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "game_question_id"
    t.index ["game_question_id"], name: "index_user_answers_on_game_question_id"
    t.index ["user_id"], name: "index_user_answers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "image"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "oauth_secret"
    t.string   "user_name"
    t.string   "password_digest"
  end

end
