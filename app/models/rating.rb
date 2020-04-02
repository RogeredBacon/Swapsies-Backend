# frozen_string_literal: true

class Rating < ApplicationRecord
  belongs_to :trade_request
  belongs_to :user
end
