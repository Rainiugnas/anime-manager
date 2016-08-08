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

ActiveRecord::Schema.define(version: 20160808032813) do

  create_table "animes", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "adala"
    t.string   "t411"
    t.string   "trailer"
    t.string   "step"
    t.string   "state"
    t.string   "season"
    t.integer  "rate"
    t.date     "estimate"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "animes_releases", force: :cascade do |t|
    t.integer "anime_id"
    t.integer "release_id"
  end

  add_index "animes_releases", ["anime_id"], name: "index_animes_releases_on_anime_id"
  add_index "animes_releases", ["release_id"], name: "index_animes_releases_on_release_id"

  create_table "releases", force: :cascade do |t|
    t.string   "quarter"
    t.integer  "year"
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
