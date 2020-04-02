# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :user
  has_many :trade_request_item
end
