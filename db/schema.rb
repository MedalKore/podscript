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

ActiveRecord::Schema.define(version: 20150223221511) do

  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table "employee_order_relationships", force: true do |t|
    t.integer  "employee_id"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", force: true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "last_employee_assigned_an_orders", force: true do |t|
    t.integer  "employee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "user_id"
    t.integer  "order_number"
    t.string   "podcast_location"
    t.string   "podcast_title"
    t.string   "podcast_subject"
    t.string   "order_of_appearance"
    t.string   "transcript"
    t.datetime "completed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "total"
    t.string   "delivery_length"
    t.integer  "last_4"
    t.integer  "employee_id"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.string   "auth_token"
    t.string   "stripe_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "last_4_digits"
  end

end
