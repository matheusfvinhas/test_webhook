class CreateRepositories < ActiveRecord::Migration[5.2]
  def change
    create_table :repositories, id: false do |t|
      t.integer :id, primary_key: true
      t.string :node_id
      t.string :name
      t.string :full_name
      t.string :default
      t.boolean :private
      t.string :html_url
      t.string :description
      t.boolean :fork
      t.string :url
      t.string :forks_url
      t.string :keys_url
      t.string :collaborators_url
      t.string :teams_url
      t.string :hooks_url
      t.string :issue_events_url
      t.string :events_url
      t.string :assignees_url
      t.string :branches_url
      t.string :tags_url
      t.string :blobs_url
      t.string :git_tags_url
      t.string :git_refs_url
      t.string :trees_url
      t.string :statuses_url
      t.string :languages_url
      t.string :stargazers_url
      t.string :contributors_url
      t.string :subscribers_url
      t.string :subscription_url
      t.string :commits_url
      t.string :git_commits_url
      t.string :comments_url
      t.string :issue_comment_url
      t.string :contents_url
      t.string :compare_url
      t.string :merges_url
      t.string :archive_url
      t.string :downloads_url
      t.string :issues_url
      t.string :pulls_url
      t.string :milestones_url
      t.string :notifications_url
      t.string :labels_url
      t.string :releases_url
      t.string :deployments_url
      t.datetime :created_at
      t.datetime :updated_at
      t.datetime :pushed_at
      t.string :git_url
      t.string :ssh_url
      t.string :clone_url
      t.string :svn_url
      t.string :homepage
      t.integer :size
      t.integer :stargazers_count
      t.integer :watchers_count
      t.string :language
      t.boolean :has_issues
      t.boolean :has_projects
      t.boolean :has_downloads
      t.boolean :has_wiki
      t.boolean :has_pages
      t.integer :forks_count
      t.string :mirror_url
      t.string :archived
      t.integer :open_issues_count
      t.string :license
      t.integer :forks
      t.integer :open_issues
      t.integer :watchers
      t.string :default_branch
      t.references :owner, foreign_key: { to_table: :users }

      t.timestamps
    end
    add_index :repositories, :id, unique: true
  end
end
