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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120607063249) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "channels", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "genres", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "program_genres", :force => true do |t|
    t.integer  "program_id"
    t.integer  "genre_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "program_genres", ["genre_id"], :name => "index_program_genres_on_genre_id"
  add_index "program_genres", ["program_id"], :name => "index_program_genres_on_program_id"

  create_table "programs", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "programs", ["category_id"], :name => "index_programs_on_category_id"

  create_table "schedules", :force => true do |t|
    t.integer  "program_id"
    t.integer  "channel_id"
    t.integer  "start"
    t.integer  "end"
    t.date     "premiere"
    t.date     "finale"
    t.string   "recurrence"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "schedules", ["channel_id"], :name => "index_schedules_on_channel_id"
  add_index "schedules", ["program_id"], :name => "index_schedules_on_program_id"

  create_table "subscribe_lists", :force => true do |t|
    t.integer  "user_id"
    t.integer  "program_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
