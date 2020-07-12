# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_200_312_173_107) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'items', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.string 'title'
    t.string 'subtitle'
    t.text 'description'
    t.string 'worth_rating'
    t.string 'image'
    t.integer 'amount'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_items_on_user_id'
  end

  create_table 'messages', force: :cascade do |t|
    t.bigint 'user_conversation_id', null: false
    t.bigint 'user_id', null: false
    t.text 'message'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_conversation_id'], name: 'index_messages_on_user_conversation_id'
    t.index ['user_id'], name: 'index_messages_on_user_id'
  end

  create_table 'ratings', force: :cascade do |t|
    t.bigint 'trade_request_id', null: false
    t.bigint 'user_id', null: false
    t.integer 'rating'
    t.text 'comment'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['trade_request_id'], name: 'index_ratings_on_trade_request_id'
    t.index ['user_id'], name: 'index_ratings_on_user_id'
  end

  create_table 'skills', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.string 'title'
    t.string 'subtitle'
    t.text 'description'
    t.string 'worth_rating'
    t.string 'image'
    t.integer 'session_time'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_skills_on_user_id'
  end

  create_table 'trade_request_items', force: :cascade do |t|
    t.bigint 'trade_request_id', null: false
    t.bigint 'item_id', null: false
    t.boolean 'locked'
    t.integer 'amount'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['item_id'], name: 'index_trade_request_items_on_item_id'
    t.index ['trade_request_id'], name: 'index_trade_request_items_on_trade_request_id'
  end

  create_table 'trade_request_skills', force: :cascade do |t|
    t.bigint 'trade_request_id', null: false
    t.bigint 'skill_id', null: false
    t.boolean 'locked'
    t.integer 'amount'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['skill_id'], name: 'index_trade_request_skills_on_skill_id'
    t.index ['trade_request_id'], name: 'index_trade_request_skills_on_trade_request_id'
  end

  create_table 'trade_requests', force: :cascade do |t|
    t.bigint 'initiating_user_id', null: false
    t.bigint 'receiving_user_id', null: false
    t.string 'status'
    t.boolean 'initiator_complete'
    t.boolean 'receiver_complete'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['initiating_user_id'], name: 'index_trade_requests_on_initiating_user_id'
    t.index ['receiving_user_id'], name: 'index_trade_requests_on_receiving_user_id'
  end

  create_table 'user_conversations', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'other_user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['other_user_id'], name: 'index_user_conversations_on_other_user_id'
    t.index ['user_id'], name: 'index_user_conversations_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'email'
    t.string 'password_digest'
    t.string 'location'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'items', 'users'
  add_foreign_key 'messages', 'user_conversations'
  add_foreign_key 'messages', 'users'
  add_foreign_key 'ratings', 'trade_requests'
  add_foreign_key 'ratings', 'users'
  add_foreign_key 'skills', 'users'
  add_foreign_key 'trade_request_items', 'items'
  add_foreign_key 'trade_request_items', 'trade_requests'
  add_foreign_key 'trade_request_skills', 'skills'
  add_foreign_key 'trade_request_skills', 'trade_requests'
end
