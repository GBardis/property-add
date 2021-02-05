# frozen_string_literal: true

class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.string :title, limit: 155, null: false
      t.integer :levels, default: 0
      t.integer :bathrooms, default: 0
      t.integer :property_transaction, null: false
      t.integer :property_type, null: false
      t.string :area, null: false
      t.integer :price, precision: 8, scale: 2, null: false
      t.text :description
      t.string :place_id
      t.timestamps
    end
  end
end
