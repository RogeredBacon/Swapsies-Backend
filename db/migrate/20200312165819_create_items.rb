# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :subtitle
      t.text :description
      t.string :worth_rating
      t.string :image
      t.integer :amount

      t.timestamps
    end
  end
end
