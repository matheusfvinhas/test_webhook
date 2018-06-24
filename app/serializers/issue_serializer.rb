# frozen_string_literal: true

class IssueSerializer < ActiveModel::Serializer
  attributes  :id, :url, :repository_url, :labels_url, :comments_url, :events_url, :html_url,
   :node_id, :number, :title, :state, :locked, :milestone, :comments, :created_at, :updated_at,
   :closed_at, :author_association, :body, :user, :assignee, :assignees, :labels

  belongs_to :user
  belongs_to :assignee, class_name: 'User'
  has_many :events
  has_many :issue_assignees
  has_many :assignees, through: :issue_assignees, source: :user
end
