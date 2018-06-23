# frozen_string_literal: true

class CreateLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :labels, id: false do |t|
      t.integer :id, primary_key: true
      t.string :node_id
      t.string :url
      t.string :name
      t.string :color
      t.boolean :default

      t.timestamps
    end
    add_index :labels, :id, unique: true
  end
end
