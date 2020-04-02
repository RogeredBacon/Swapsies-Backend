class UserConversation < ApplicationRecord
  belongs_to :user, :class_name => 'User'
  belongs_to :other_user, :class_name => 'User'
  has_many :message
end
