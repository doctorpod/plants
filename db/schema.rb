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

ActiveRecord::Schema.define(version: 2020_05_18_172322) do

  create_table "growing_stages", force: :cascade do |t|
    t.integer "growing_id"
    t.string "stage_type"
    t.date "started_on"
    t.string "growing_medium"
    t.string "location"
    t.date "first_growth_on"
    t.integer "num_started"
    t.integer "num_growing"
    t.integer "num_lost"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["growing_id"], name: "index_growing_stages_on_growing_id"
  end

  create_table "growings", force: :cascade do |t|
    t.integer "seed_id"
    t.date "sown_on"
    t.string "compost_mix"
    t.string "location"
    t.text "notes"
    t.integer "num_sown"
    t.integer "num_germinated"
    t.date "first_germinated_on"
    t.date "potted_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "planted_out"
    t.string "plant_name"
    t.boolean "for_sale", default: false
    t.string "name"
    t.index ["name"], name: "index_growings_on_name", unique: true
  end

  create_table "seeds", force: :cascade do |t|
    t.string "name"
    t.date "acquired"
    t.string "source"
    t.date "sow_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "direct_sowing_months"
    t.string "covered_sowing_months"
    t.boolean "seeds_remaining", default: true
  end

end
