# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events, id: false do |t|
      t.integer :id, auto_increment: true, primary_key: true, unique: true
      t.string :action
      t.references :repository, foreign_key: true
      t.references :sender, foreign_key: { to_table: :users }
      t.references :issue, foreign_key: true

      t.timestamps
    end
    add_index :events, :id, unique: true
  end
end
