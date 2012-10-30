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

ActiveRecord::Schema.define(:version => 20120320163322) do

  create_table "admins", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "app_settings", :force => true do |t|
    t.boolean  "enterprise_register", :default => true
    t.boolean  "enterprise_login",    :default => true
    t.boolean  "student_register",    :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "areas", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "areas_inscriptions", :force => true do |t|
    t.integer  "area_id"
    t.integer  "inscription_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favorites", :force => true do |t|
    t.integer  "user_id"
    t.integer  "inscription_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inscriptions", :force => true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "status"
    t.boolean  "centrale",            :default => true
    t.boolean  "wants_to_present",    :default => true
    t.string   "telephone"
    t.datetime "avatar_updated_at"
    t.integer  "avatar_file_size"
    t.string   "avatar_content_type"
    t.string   "avatar_file_name"
    t.datetime "cv_updated_at"
    t.integer  "cv_file_size"
    t.string   "cv_content_type"
    t.string   "cv_file_name"
    t.integer  "laboratory"
    t.date     "birthday"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved",            :default => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "tagline"
    t.string   "domain"
    t.boolean  "wants_to_interview"
    t.datetime "logo_updated_at"
    t.integer  "logo_file_size"
    t.string   "logo_content_type"
    t.string   "logo_file_name"
    t.string   "website"
    t.string   "telephone"
    t.boolean  "admin",                  :default => false
    t.boolean  "approved",               :default => false
    t.boolean  "lunch"
    t.integer  "participants"
    t.string   "responsable"
    t.string   "comments"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
