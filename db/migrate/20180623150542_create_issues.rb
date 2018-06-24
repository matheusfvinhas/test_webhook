# frozen_string_literal: true

class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues, id: false do |t|
      t.integer :id, primary_key: true
      t.string :url
      t.string :repository_url
      t.string :labels_url
      t.string :comments_url
      t.string :events_url
      t.string :html_url
      t.string :node_id
      t.integer :number
      t.string :title
      t.references :user, foreign_key: true
      t.references :assignee, foreign_key: { to_table: :users }
      t.string :state
      t.boolean :locked
      t.string :milestone
      t.integer :comments
      t.datetime :created_at
      t.datetime :updated_at
      t.datetime :closed_at
      t.string :author_association
      t.string :body

      t.timestamps
    end
    add_index :issues, :id, unique: true
  end
end
