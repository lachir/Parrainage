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

ActiveRecord::Schema.define(version: 20130930212811) do

  create_table "bouls", force: true do |t|
    t.string   "nom"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.text     "content"
    t.integer  "pg_id"
    t.integer  "onscrit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["onscrit_id"], name: "index_comments_on_onscrit_id", using: :btree
  add_index "comments", ["pg_id"], name: "index_comments_on_pg_id", using: :btree

  create_table "fillots", force: true do |t|
    t.integer  "pg_id"
    t.integer  "onscrit_id"
    t.integer  "semaine_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fillots", ["onscrit_id"], name: "index_fillots_on_onscrit_id", using: :btree
  add_index "fillots", ["pg_id"], name: "index_fillots_on_pg_id", using: :btree
  add_index "fillots", ["semaine_id"], name: "index_fillots_on_semaine_id", using: :btree

  create_table "manips", force: true do |t|
    t.string   "nom"
    t.string   "lieu"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "date"
  end

  create_table "onscrits", force: true do |t|
    t.string   "nom"
    t.string   "prenom"
    t.date     "naissance"
    t.integer  "prepa_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "num"
  end

  add_index "onscrits", ["prepa_id"], name: "index_onscrits_on_prepa_id", using: :btree

  create_table "pgs", force: true do |t|
    t.string   "nom"
    t.string   "prenom"
    t.string   "bucque"
    t.string   "fam"
    t.boolean  "saque"
    t.integer  "boul_id"
    t.integer  "prepa_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "barcode"
    t.date     "naissance"
    t.string   "password_digest"
    t.string   "tel"
    t.string   "biocit"
    t.integer  "level"
    t.string   "bio"
    t.string   "comment"
  end

  add_index "pgs", ["boul_id"], name: "index_pgs_on_boul_id", using: :btree
  add_index "pgs", ["prepa_id"], name: "index_pgs_on_prepa_id", using: :btree

  create_table "prepas", force: true do |t|
    t.string   "nom"
    t.string   "ville"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "presences", force: true do |t|
    t.integer  "manip_id"
    t.integer  "pg_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "presences", ["manip_id"], name: "index_presences_on_manip_id", using: :btree
  add_index "presences", ["pg_id"], name: "index_presences_on_pg_id", using: :btree

  create_table "semaines", force: true do |t|
    t.string   "nom"
    t.text     "description"
    t.date     "startdate"
    t.date     "enddate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sondages", force: true do |t|
    t.string   "nom"
    t.text     "description"
    t.integer  "nbchoix"
    t.datetime "startdate"
    t.datetime "enddate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "valeurs", force: true do |t|
    t.integer  "manip_id"
    t.integer  "boul_id"
    t.integer  "point"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "valeurs", ["boul_id"], name: "index_valeurs_on_boul_id", using: :btree
  add_index "valeurs", ["manip_id"], name: "index_valeurs_on_manip_id", using: :btree

  create_table "votes", force: true do |t|
    t.integer  "priorite"
    t.integer  "pg_id"
    t.integer  "onscrit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sondage_id"
  end

  add_index "votes", ["onscrit_id"], name: "index_votes_on_onscrit_id", using: :btree
  add_index "votes", ["pg_id"], name: "index_votes_on_pg_id", using: :btree
  add_index "votes", ["sondage_id"], name: "index_votes_on_sondage_id", using: :btree

end
