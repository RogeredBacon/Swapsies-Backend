# frozen_string_literal: true

class CreateUserConversations < ActiveRecord::Migration[6.0]
  def change
    create_table :user_conversations do |t|
      t.references :user, null: false
      t.references :other_user, null: false

      t.timestamps
    end
  end
end
