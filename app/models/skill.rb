# frozen_string_literal: true

class Skill < ApplicationRecord
  belongs_to :user
  has_many :trade_request_skill
end
