# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: false do |t|
      t.string :login
      t.integer :id, primary_key: true
      t.string :node_id
      t.string :avatar_url
      t.string :gravatar_id
      t.string :url
      t.string :html_url
      t.string :followers_url
      t.string :following_url
      t.string :gists_url
      t.string :starred_url
      t.string :subscriptions_url
      t.string :organizations_url
      t.string :repos_url
      t.string :events_url
      t.string :received_events_url
      t.string :type
      t.boolean :site_admin

      t.timestamps
    end
    add_index :users, :login, unique: true
    add_index :users, :id, unique: true
  end
end
