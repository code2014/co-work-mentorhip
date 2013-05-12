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

ActiveRecord::Schema.define(:version => 20130430213128) do

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "weburl"
  end

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.string   "category"
    t.text     "description"
    t.integer  "price"
    t.boolean  "ongoing"
    t.datetime "startdate"
    t.datetime "enddate"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "coursetimes", :force => true do |t|
    t.integer  "course_id"
    t.time     "start"
    t.time     "end"
    t.string   "dayofweek"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "individuals", :force => true do |t|
    t.string   "firstname"
    t.string   "college"
    t.text     "hobbies"
    t.float    "gpa"
    t.text     "testscores"
    t.string   "major"
    t.string   "familyincome"
    t.text     "bio"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.string   "email"
    t.string   "token"
    t.string   "password_digest"
    t.text     "topics"
    t.string   "lastname"
    t.datetime "birthday"
    t.string   "gender"
    t.string   "futurehopesanddreams"
    t.text     "goalinlife"
    t.string   "academiclevel"
    t.string   "academicyear"
    t.string   "highschool"
    t.float    "highschoolgpa"
    t.integer  "satscore"
    t.integer  "satverbalscore"
    t.integer  "satmathscore"
    t.integer  "actscore"
    t.integer  "actmathscore"
    t.text     "ap"
    t.string   "mathclass"
    t.integer  "proficiencymath"
    t.integer  "proficiencyreading"
    t.integer  "proficiencyscience"
    t.integer  "proficiencysocialstudies"
    t.integer  "proficiencybusiness"
    t.integer  "proficiencyeconomics"
    t.integer  "proficiencymusic"
    t.integer  "proficiencyforeignlanguage"
    t.integer  "proficiencysports"
    t.integer  "proficiencycommunityservice"
    t.integer  "proficiencypublicspeaking"
    t.integer  "proficiencyleadership"
    t.integer  "proficiencydance"
    t.integer  "proficiencyart"
    t.integer  "proficiencyacting"
    t.text     "foreignlanguage"
    t.string   "hourlyrate"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "phonenumber"
    t.string   "favoritecolor"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.integer  "details_id"
    t.string   "details_type"
    t.string   "weburl"
  end

  create_table "order_transactions", :force => true do |t|
    t.integer  "order_id"
    t.string   "action"
    t.integer  "amount"
    t.boolean  "success"
    t.string   "authorization"
    t.string   "message"
    t.text     "params"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "course_id"
    t.string   "ip_address"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "card_type"
    t.date     "card_expires_on"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "purchasers", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.text     "topics"
    t.text     "bio"
    t.string   "token"
    t.string   "hourlyrate"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "phonenumber"
    t.string   "favoritecolor"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.integer  "details_id"
    t.string   "details_type"
    t.string   "slug"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "zipcode"
    t.boolean  "emailverified"
    t.boolean  "gmaps"
    t.string   "weburl"
    t.string   "url"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
