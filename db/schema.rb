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

ActiveRecord::Schema.define(:version => 20130427222509) do

  create_table "languages", :force => true do |t|
    t.string "name", :limit => 10
  end

  add_index "languages", ["name"], :name => "index_languages_on_name", :unique => true

  create_table "locale_files", :force => true do |t|
    t.string   "file"
    t.integer  "project_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "name",                      :null => false
    t.integer  "file_type",  :default => 0, :null => false
  end

  add_index "locale_files", ["project_id"], :name => "index_locale_files_on_project_id"

  create_table "phrase_translations", :force => true do |t|
    t.integer  "phrase_id"
    t.integer  "language_id"
    t.integer  "user_id"
    t.integer  "version_number", :default => 0, :null => false
    t.string   "value"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "phrase_translations", ["language_id"], :name => "index_phrase_translations_on_language_id"
  add_index "phrase_translations", ["phrase_id"], :name => "index_phrase_translations_on_phrase_id"
  add_index "phrase_translations", ["user_id"], :name => "index_phrase_translations_on_user_id"

  create_table "phrases", :force => true do |t|
    t.string   "name"
    t.string   "ancestry"
    t.integer  "locale_file_id"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.boolean  "complicated",    :default => false, :null => false
  end

  add_index "phrases", ["ancestry"], :name => "index_phrases_on_ancestry"
  add_index "phrases", ["locale_file_id"], :name => "index_phrases_on_locale_file_id"

  create_table "project_languages", :force => true do |t|
    t.integer  "project_id"
    t.integer  "language_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "project_languages", ["language_id"], :name => "index_project_languages_on_language_id"
  add_index "project_languages", ["project_id"], :name => "index_project_languages_on_project_id"

  create_table "project_users", :force => true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.integer  "role"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "project_users", ["project_id"], :name => "index_project_users_on_project_id"
  add_index "project_users", ["user_id"], :name => "index_project_users_on_user_id"

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "project_type"
  end

  create_table "translation_histories", :force => true do |t|
    t.integer  "phrase_translation_id"
    t.integer  "user_id"
    t.integer  "version_number",        :default => 0, :null => false
    t.string   "value"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  add_index "translation_histories", ["phrase_translation_id"], :name => "index_translation_histories_on_phrase_translation_id"
  add_index "translation_histories", ["user_id"], :name => "index_translation_histories_on_user_id"

  create_table "translators", :force => true do |t|
    t.integer  "user_id"
    t.text     "description"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "name"
  end

  add_index "translators", ["user_id"], :name => "index_translators_on_user_id", :unique => true

  create_table "translators_languages", :force => true do |t|
    t.integer "translator_id"
    t.integer "language_id"
    t.integer "level",         :limit => 2
    t.text    "description"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "role"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["role"], :name => "index_users_on_role"

end
