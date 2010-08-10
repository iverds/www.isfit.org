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

ActiveRecord::Schema.define(:version => 20100810231810) do

  create_table "applicants", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "mail"
    t.integer  "phone"
    t.text     "information"
    t.text     "background"
    t.integer  "position_id_1"
    t.integer  "position_id_2"
    t.integer  "position_id_3"
    t.text     "heardof"
    t.integer  "status"
    t.string   "interview_place_1"
    t.string   "interview_place_2"
    t.string   "interview_place_3"
    t.datetime "interview_time_1"
    t.datetime "interview_time_2"
    t.datetime "interview_time_3"
    t.integer  "interviewer_id_1_1"
    t.integer  "interviewer_id_1_2"
    t.integer  "interviewer_id_2_1"
    t.integer  "interviewer_id_2_2"
    t.integer  "interviewer_id_3_1"
    t.integer  "interviewer_id_3_2"
    t.integer  "deleted"
    t.string   "username"
    t.string   "password"
    t.string   "dn"
    t.integer  "has_account"
    t.integer  "is_notified"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", :force => true do |t|
    t.string   "title_en"
    t.string   "title_no"
    t.text     "ingress_en"
    t.text     "ingress_no"
    t.text     "body_en"
    t.text     "body_no"
    t.boolean  "list"
    t.integer  "weight"
    t.boolean  "deleted"
    t.boolean  "press_release"
    t.text     "sub_title_en"
    t.text     "sub_title_no"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "main_article"
  end

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.integer  "region_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.string   "event_type"
    t.date     "date"
    t.integer  "price_member"
    t.integer  "price_other"
    t.text     "ingress"
    t.text     "description"
    t.integer  "related_evend_id"
    t.boolean  "deleted"
    t.boolean  "important"
    t.boolean  "visible"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "title_en"
    t.string   "title_no"
    t.text     "ingress_en"
    t.text     "ingress_no"
    t.text     "body_en"
    t.text     "body_no"
    t.string   "tag"
    t.boolean  "deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participants", :force => true do |t|
    t.datetime "registered_time"
    t.datetime "checked_in"
    t.datetime "picked_up"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.text     "address1"
    t.text     "address2"
    t.string   "zipcode"
    t.string   "city"
    t.integer  "country_id"
    t.string   "phone"
    t.string   "email"
    t.string   "fax"
    t.string   "nationality"
    t.date     "birthdate"
    t.string   "sex"
    t.string   "university"
    t.string   "field_of_study"
    t.string   "org_name"
    t.string   "org_function"
    t.string   "hear_about_isfit"
    t.string   "hear_about_isfit_other"
    t.integer  "workshop1"
    t.integer  "workshop2"
    t.integer  "workshop3"
    t.text     "essay1"
    t.text     "essay2"
    t.integer  "travel_apply"
    t.text     "travel_essay"
    t.string   "travel_amount"
    t.integer  "travel_nosupport_other"
    t.integer  "travel_nosupport_cancome"
    t.integer  "participant_grade"
    t.text     "participant_comment"
    t.integer  "participant_functionary_id"
    t.integer  "theme_grade1"
    t.integer  "theme_grade2"
    t.text     "theme_comment"
    t.integer  "theme_functionary_id"
    t.string   "password"
    t.integer  "final_workshop"
    t.integer  "invited"
    t.integer  "travel_assigned"
    t.integer  "travel_assigned_amount"
    t.text     "travel_comment"
    t.integer  "host_id"
    t.datetime "last_login"
    t.integer  "notified_invitation"
    t.integer  "notified_travel_support"
    t.integer  "notified_rejection"
    t.integer  "notified_no_travel_support"
    t.integer  "notified_rejection_again"
    t.date     "arrivel_date"
    t.string   "arrivel_place"
    t.time     "arrival_time"
    t.string   "arrival_carrier"
    t.integer  "arrival_isfit_trans"
    t.string   "arrival_airline"
    t.string   "arrival_flight_number"
    t.date     "departure_date"
    t.time     "departure_time"
    t.string   "departure_carrier"
    t.integer  "departure_isfit_trans"
    t.string   "departure_place"
    t.integer  "notified_custom"
    t.datetime "request_travel"
    t.integer  "accept_travel"
    t.datetime "accepted_travel_time"
    t.integer  "bed"
    t.integer  "bedding"
    t.integer  "apecial_invite"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", :force => true do |t|
    t.string   "image_text_en"
    t.string   "image_text_no"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "main_picture_file_name"
    t.string   "main_picture_content_type"
    t.integer  "main_picture_file_size"
    t.datetime "main_picture_updated_at"
  end

  create_table "positions", :force => true do |t|
    t.string   "title_en"
    t.string   "title_no"
    t.integer  "person_id"
    t.text     "description_en"
    t.text     "description_no"
    t.string   "group_dn"
    t.integer  "admission_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", :force => true do |t|
    t.string   "name_no"
    t.string   "name_en"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sublinks", :force => true do |t|
    t.integer  "tab_id"
    t.string   "title_en"
    t.string   "title_no"
    t.string   "url"
    t.string   "external_url"
    t.integer  "order"
    t.boolean  "deleted"
    t.integer  "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tabs", :force => true do |t|
    t.string   "name_en"
    t.string   "name_no"
    t.string   "tag"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workshops", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
