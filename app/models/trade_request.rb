# frozen_string_literal: true

class TradeRequest < ApplicationRecord
  has_many :trade_request_item
  has_many :trade_request_skill
  belongs_to :initiating_user, class_name: 'User'
  belongs_to :receiving_user, class_name: 'User'
  has_many :rating
end
