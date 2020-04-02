# frozen_string_literal: true

class User < ApplicationRecord
  has_many :message, through: :user_conversation
  has_many :rating
  has_many :item
  has_many :skill
  has_many :trade_request
  has_many :trade_request_item, through: :trade_request
  has_many :trade_request_skill, through: :trade_request
  has_many :first_user, class_name: 'UserConversation', foreign_key: 'users_id'
  has_many :second_user, class_name: 'UserConversation', foreign_key: 'other_users_id'
  has_many :initiating_user, class_name: 'TradeRequest', foreign_key: 'initiating_users_id'
  has_many :receiving_user, class_name: 'TradeRequest', foreign_key: 'receiving_users_id'

  has_secure_password
end
