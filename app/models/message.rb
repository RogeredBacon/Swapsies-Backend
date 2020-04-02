# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :user_conversation
  belongs_to :user
end
