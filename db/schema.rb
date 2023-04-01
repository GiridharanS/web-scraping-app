# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_230_328_163_115) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'categories', force: :cascade do |t|
    t.string 'name'
    t.string 'image_url'
    t.text 'description'
    t.bigint 'restaurant_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['restaurant_id'], name: 'index_categories_on_restaurant_id'
  end

  create_table 'locations', force: :cascade do |t|
    t.string 'city'
    t.string 'state'
    t.string 'country'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'products', force: :cascade do |t|
    t.string 'name'
    t.string 'image_url'
    t.text 'description'
    t.float 'price'
    t.bigint 'category_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['category_id'], name: 'index_products_on_category_id'
  end

  create_table 'restaurants', force: :cascade do |t|
    t.string 'name'
    t.string 'restaurant_type'
    t.text 'description'
    t.bigint 'location_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['location_id'], name: 'index_restaurants_on_location_id'
  end

  add_foreign_key 'categories', 'restaurants'
  add_foreign_key 'products', 'categories'
  add_foreign_key 'restaurants', 'locations'
end
