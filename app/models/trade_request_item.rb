# frozen_string_literal: true

class TradeRequestItem < ApplicationRecord
  belongs_to :trade_request
  belongs_to :item
end
