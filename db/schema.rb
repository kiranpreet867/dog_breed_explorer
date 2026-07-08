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

ActiveRecord::Schema[7.2].define(version: 2026_07_08_161430) do
  create_table "breed_images", force: :cascade do |t|
    t.string "image_url"
    t.integer "breed_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["breed_id"], name: "index_breed_images_on_breed_id"
  end

  create_table "breeds", force: :cascade do |t|
    t.string "name"
    t.string "bred_for"
    t.string "breed_group"
    t.text "temperament"
    t.string "life_span"
    t.string "origin"
    t.string "reference_image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "reviewer_name"
    t.integer "rating"
    t.text "comment"
    t.integer "breed_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["breed_id"], name: "index_reviews_on_breed_id"
  end

  add_foreign_key "breed_images", "breeds"
  add_foreign_key "reviews", "breeds"
end
