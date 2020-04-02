# frozen_string_literal: true

class CreateTradeRequestItems < ActiveRecord::Migration[6.0]
  def change
    create_table :trade_request_items do |t|
      t.references :trade_request, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.boolean :locked
      t.integer :amount

      t.timestamps
    end
  end
end
