# frozen_string_literal: true

class Issue < ApplicationRecord
  belongs_to :user
  belongs_to :assignee, class_name: 'User'
  has_and_belongs_to_many :labels
  has_many :issue_assignees
  has_many :assignees, through: :issue_assignees
end
