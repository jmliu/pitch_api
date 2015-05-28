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

ActiveRecord::Schema.define(version: 20150528000712) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.string   "game_id"
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "games", ["game_id"], name: "index_games_on_game_id", using: :btree

  create_table "pitcher_games", force: :cascade do |t|
    t.integer  "pitcher_id"
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pitcher_games", ["game_id"], name: "index_pitcher_games_on_game_id", using: :btree
  add_index "pitcher_games", ["pitcher_id"], name: "index_pitcher_games_on_pitcher_id", using: :btree

  create_table "pitchers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "mlb_id"
    t.string   "throws"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pitchers", ["mlb_id"], name: "index_pitchers_on_mlb_id", using: :btree

  create_table "pitches", force: :cascade do |t|
    t.float    "speed"
    t.string   "pitch_type"
    t.boolean  "swing"
    t.float    "horizontal_movement"
    t.float    "vertical_movement"
    t.float    "spin_rate"
    t.integer  "pitcher_id"
    t.integer  "game_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "pitches", ["game_id"], name: "index_pitches_on_game_id", using: :btree
  add_index "pitches", ["pitcher_id"], name: "index_pitches_on_pitcher_id", using: :btree

  add_foreign_key "pitcher_games", "games"
  add_foreign_key "pitcher_games", "pitchers"
  add_foreign_key "pitches", "games"
  add_foreign_key "pitches", "pitchers"
end
