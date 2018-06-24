# frozen_string_literal: true

class IssueSerializer < ActiveModel::Serializer
  def attributes(*_args)
    object.attributes.symbolize_keys
  end

  belongs_to :user
  belongs_to :assignee, class_name: 'User'
  has_many :events
  has_many :issue_assignees
  has_many :assignees, through: :issue_assignees, source: :user
end
