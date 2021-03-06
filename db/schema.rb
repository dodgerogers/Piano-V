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

ActiveRecord::Schema.define(:version => 20120823125320) do

  create_table "comments", :force => true do |t|
    t.integer  "post_id"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["user_id", "created_at"], :name => "index_comments_on_user_id_and_created_at"

  create_table "posts", :force => true do |t|
    t.integer  "user_id"
    t.string   "song_name"
    t.text     "song"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.float    "rating"
    t.integer  "ratings_count", :default => 0
  end

  add_index "posts", ["song_name", "created_at", "updated_at"], :name => "index_posts_on_song_name_and_created_at_and_updated_at"

  create_table "ratings", :force => true do |t|
    t.integer "rating"
    t.integer "user_id"
    t.integer "post_id"
    t.decimal "ratings_average", :precision => 4, :scale => 2
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
