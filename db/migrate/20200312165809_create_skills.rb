# frozen_string_literal: true

class CreateSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :skills do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :subtitle
      t.text :description
      t.string :worth_rating
      t.string :image
      t.integer :session_time

      t.timestamps
    end
  end
end
