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

ActiveRecord::Schema.define(version: 2020_05_10_122132) do

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

  create_table "sowings", force: :cascade do |t|
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
  end

end
