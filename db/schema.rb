# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100315132844) do

  create_table "appforms", :force => true do |t|
    t.integer  "job_id"
    t.string   "salutation"
    t.string   "title"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "add_street"
    t.string   "add_city"
    t.string   "telephone"
    t.string   "email"
    t.string   "current_position"
    t.string   "desired_income"
    t.string   "qualifications"
    t.string   "education"
    t.string   "university"
    t.text     "other"
    t.text     "it_skills"
    t.text     "lang_other"
    t.text     "reason"
    t.text     "personal_values"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
    t.string   "report_file_name"
    t.string   "report_content_type"
    t.integer  "report_file_size"
    t.datetime "report_updated_at"
    t.boolean  "contact"
    t.boolean  "re_know_how"
    t.boolean  "lang_eng_fluent"
    t.boolean  "lang_eng_good"
    t.boolean  "lang_ger_fluent"
    t.boolean  "lang_spa_fluent"
    t.boolean  "lang_spa_good"
    t.boolean  "lang_ger_good"
  end

  create_table "application_forms", :force => true do |t|
    t.integer  "job_id"
    t.string   "salutation"
    t.string   "title"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "add_street"
    t.string   "add_city"
    t.string   "telephone"
    t.string   "email"
    t.string   "current_position"
    t.string   "desired_income"
    t.string   "qualifications"
    t.string   "education"
    t.string   "university"
    t.text     "other"
    t.text     "it_skills"
    t.text     "lang_other"
    t.text     "reason"
    t.text     "personal_values"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
    t.string   "report_file_name"
    t.string   "report_content_type"
    t.integer  "report_file_size"
    t.datetime "report_updated_at"
    t.boolean  "contact"
    t.boolean  "re_know_how"
    t.boolean  "lang_eng_fluent"
    t.boolean  "lang_eng_good"
    t.boolean  "lang_ger_fluent"
    t.boolean  "lang_spa_fluent"
    t.boolean  "lang_spa_good"
    t.boolean  "lang_ger_good"
  end

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
    t.string   "navlabel"
    t.integer  "position"
    t.string   "name"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "main_file_name"
    t.string   "main_content_type"
    t.integer  "main_file_size"
    t.datetime "main_updated_at"
    t.string   "title_front"
    t.string   "title_back"
    t.string   "link_text"
    t.string   "description_swf"
  end

  create_table "category_mains", :force => true do |t|
    t.integer  "category_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "telephone"
    t.string   "email"
    t.string   "interested_in"
    t.string   "property_type"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.integer  "beds"
    t.integer  "baths"
    t.string   "price_range"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", :force => true do |t|
    t.string   "title"
    t.integer  "measurment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country_initials"
    t.string   "flag_file_name"
    t.string   "flag_content_type"
    t.integer  "flag_file_size"
    t.datetime "flag_updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "developments", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "type_id"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facilities", :force => true do |t|
    t.string   "title"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facilities_properties", :id => false, :force => true do |t|
    t.integer  "facility_id"
    t.integer  "property_id"
    t.integer  "total"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faqs", :force => true do |t|
    t.text     "question"
    t.text     "answer"
    t.string   "user_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "gossip"
  end

  create_table "featured_galleries", :force => true do |t|
    t.integer  "property_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "featured_photos", :force => true do |t|
    t.integer  "page_id"
    t.integer  "property_id"
    t.integer  "size"
    t.string   "content_type"
    t.string   "filename"
    t.integer  "width"
    t.integer  "height"
    t.integer  "parent_id"
    t.string   "thumbnail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "featured_uploads", :force => true do |t|
    t.integer  "featured_gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "position"
    t.string   "title"
    t.text     "description"
  end

  create_table "galleries", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "property_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "googlemaps", :force => true do |t|
    t.integer  "property_id"
    t.string   "long_lat"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "long"
    t.string   "lat"
  end

  create_table "locations", :force => true do |t|
    t.string   "state"
    t.string   "county"
    t.string   "region"
    t.string   "other"
    t.string   "zipcod"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city"
    t.string   "city_initials"
  end

  create_table "metatags", :force => true do |t|
    t.text     "keywords"
    t.text     "description"
    t.integer  "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.integer  "property_id"
  end

  create_table "page_abouts", :force => true do |t|
    t.integer  "page_id"
    t.string   "photo_file_name"
    t.integer  "photo_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "page_featured_photos", :force => true do |t|
    t.integer  "size"
    t.string   "content_type"
    t.string   "filename"
    t.integer  "width"
    t.integer  "height"
    t.integer  "parent_id"
    t.string   "thumbnail"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "page_id"
  end

  create_table "page_mains", :force => true do |t|
    t.integer  "page_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "body_html"
    t.integer  "parent_id"
    t.string   "navlabel"
    t.integer  "position"
    t.boolean  "featured"
    t.string   "thumb_file_name"
    t.string   "thumb_content_type"
    t.integer  "thumb_file_size"
    t.datetime "thumb_updated_at"
    t.string   "main_file_name"
    t.string   "main_content_type"
    t.integer  "main_file_size"
    t.datetime "main_updated_at"
  end

  create_table "partners", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.text     "url"
    t.text     "address"
    t.string   "telephone"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "body_html"
    t.text     "description_html"
    t.string   "category"
    t.integer  "parent_id"
    t.integer  "position"
    t.string   "navlabel"
    t.string   "name"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "date_posted"
    t.datetime "date"
  end

  create_table "properties", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "bedrooms"
    t.integer  "bathrooms"
    t.integer  "living_areas"
    t.integer  "built"
    t.integer  "plot"
    t.integer  "garden"
    t.integer  "price"
    t.integer  "location_id"
    t.integer  "type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "address"
    t.boolean  "rental"
    t.string   "facility_ids"
    t.boolean  "featured"
    t.string   "mls_id"
    t.integer  "half_bathrooms"
    t.integer  "garage"
    t.string   "property_number"
    t.string   "youtube"
    t.string   "pdf_file_name"
    t.string   "pdf_content_type"
    t.integer  "pdf_file_size"
    t.datetime "pdf_updated_at"
    t.boolean  "validated"
  end

  create_table "property_thumbnails", :force => true do |t|
    t.integer  "property_id"
    t.integer  "position"
    t.string   "photo_file_name"
    t.integer  "photo_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id"], :name => "index_roles_users_on_role_id"
  add_index "roles_users", ["user_id"], :name => "index_roles_users_on_user_id"

  create_table "search_queries", :force => true do |t|
    t.string   "query"
    t.string   "country"
    t.string   "region"
    t.string   "area"
    t.string   "buy_rent"
    t.string   "price"
    t.string   "bedrooms"
    t.string   "mls"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "states"
  end

  create_table "types", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uploads", :force => true do |t|
    t.string   "description"
    t.integer  "gallery_id"
    t.string   "photo_file_name"
    t.integer  "photo_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.string   "title"
    t.boolean  "processing",      :default => true
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "language"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

  create_table "workers", :force => true do |t|
    t.string   "full_name"
    t.string   "title"
    t.text     "description"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean  "vacancy"
    t.integer  "position"
  end

end
