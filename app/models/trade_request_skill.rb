# frozen_string_literal: true

class TradeRequestSkill < ApplicationRecord
  belongs_to :trade_request
  belongs_to :skill
end
