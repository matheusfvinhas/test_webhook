# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_180_623_183_925) do
  create_table 'events', force: :cascade do |t|
    t.string 'action'
    t.integer 'repository_id'
    t.integer 'sender_id'
    t.integer 'issue_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['id'], name: 'index_events_on_id', unique: true
    t.index ['issue_id'], name: 'index_events_on_issue_id'
    t.index ['repository_id'], name: 'index_events_on_repository_id'
    t.index ['sender_id'], name: 'index_events_on_sender_id'
  end

  create_table 'issue_assignees', force: :cascade do |t|
    t.integer 'issue_id'
    t.integer 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['issue_id'], name: 'index_issue_assignees_on_issue_id'
    t.index ['user_id'], name: 'index_issue_assignees_on_user_id'
  end

  create_table 'issues', force: :cascade do |t|
    t.string 'url'
    t.string 'repository_url'
    t.string 'labels_url'
    t.string 'comments_url'
    t.string 'events_url'
    t.string 'html_url'
    t.string 'node_id'
    t.integer 'number'
    t.string 'title'
    t.integer 'user_id'
    t.integer 'assignee_id'
    t.string 'state'
    t.boolean 'locked'
    t.string 'milestone'
    t.integer 'comments'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.datetime 'closed_at'
    t.string 'author_association'
    t.string 'body'
    t.index ['assignee_id'], name: 'index_issues_on_assignee_id'
    t.index ['id'], name: 'index_issues_on_id', unique: true
    t.index ['user_id'], name: 'index_issues_on_user_id'
  end

  create_table 'issues_labels', force: :cascade do |t|
    t.integer 'issue_id'
    t.integer 'label_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['issue_id'], name: 'index_issues_labels_on_issue_id'
    t.index ['label_id'], name: 'index_issues_labels_on_label_id'
  end

  create_table 'labels', force: :cascade do |t|
    t.string 'node_id'
    t.string 'url'
    t.string 'name'
    t.string 'color'
    t.boolean 'default'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['id'], name: 'index_labels_on_id', unique: true
  end

  create_table 'repositories', force: :cascade do |t|
    t.string 'node_id'
    t.string 'name'
    t.string 'full_name'
    t.string 'default'
    t.boolean 'private'
    t.string 'html_url'
    t.string 'description'
    t.boolean 'fork'
    t.string 'url'
    t.string 'forks_url'
    t.string 'keys_url'
    t.string 'collaborators_url'
    t.string 'teams_url'
    t.string 'hooks_url'
    t.string 'issue_events_url'
    t.string 'events_url'
    t.string 'assignees_url'
    t.string 'branches_url'
    t.string 'tags_url'
    t.string 'blobs_url'
    t.string 'git_tags_url'
    t.string 'git_refs_url'
    t.string 'trees_url'
    t.string 'statuses_url'
    t.string 'languages_url'
    t.string 'stargazers_url'
    t.string 'contributors_url'
    t.string 'subscribers_url'
    t.string 'subscription_url'
    t.string 'commits_url'
    t.string 'git_commits_url'
    t.string 'comments_url'
    t.string 'issue_comment_url'
    t.string 'contents_url'
    t.string 'compare_url'
    t.string 'merges_url'
    t.string 'archive_url'
    t.string 'downloads_url'
    t.string 'issues_url'
    t.string 'pulls_url'
    t.string 'milestones_url'
    t.string 'notifications_url'
    t.string 'labels_url'
    t.string 'releases_url'
    t.string 'deployments_url'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.datetime 'pushed_at'
    t.string 'git_url'
    t.string 'ssh_url'
    t.string 'clone_url'
    t.string 'svn_url'
    t.string 'homepage'
    t.integer 'size'
    t.integer 'stargazers_count'
    t.integer 'watchers_count'
    t.string 'language'
    t.boolean 'has_issues'
    t.boolean 'has_projects'
    t.boolean 'has_downloads'
    t.boolean 'has_wiki'
    t.boolean 'has_pages'
    t.integer 'forks_count'
    t.string 'mirror_url'
    t.boolean 'archived'
    t.integer 'open_issues_count'
    t.string 'license'
    t.integer 'forks'
    t.integer 'open_issues'
    t.integer 'watchers'
    t.string 'default_branch'
    t.integer 'owner_id'
    t.index ['id'], name: 'index_repositories_on_id', unique: true
    t.index ['owner_id'], name: 'index_repositories_on_owner_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'login'
    t.string 'node_id'
    t.string 'avatar_url'
    t.string 'gravatar_id'
    t.string 'url'
    t.string 'html_url'
    t.string 'followers_url'
    t.string 'following_url'
    t.string 'gists_url'
    t.string 'starred_url'
    t.string 'subscriptions_url'
    t.string 'organizations_url'
    t.string 'repos_url'
    t.string 'events_url'
    t.string 'received_events_url'
    t.string 'type'
    t.boolean 'site_admin'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['id'], name: 'index_users_on_id', unique: true
    t.index ['login'], name: 'index_users_on_login', unique: true
  end
end
