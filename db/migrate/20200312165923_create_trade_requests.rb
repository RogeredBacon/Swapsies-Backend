# frozen_string_literal: true

class CreateTradeRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :trade_requests do |t|
      t.references :initiating_user, null: false
      t.references :receiving_user, null: false
      t.string :status
      t.boolean :initiator_complete
      t.boolean :receiver_complete

      t.timestamps
    end
  end
end
