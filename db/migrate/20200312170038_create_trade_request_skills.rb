# frozen_string_literal: true

class CreateTradeRequestSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :trade_request_skills do |t|
      t.references :trade_request, null: false, foreign_key: true
      t.references :skill, null: false, foreign_key: true
      t.boolean :locked
      t.integer :amount

      t.timestamps
    end
  end
end
