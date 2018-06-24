# frozen_string_literal: true

class Issue < ApplicationRecord
  belongs_to :user
  belongs_to :assignee, class_name: 'User'
  has_many :events
  has_and_belongs_to_many :labels
  has_many :issue_assignees
  has_many :assignees, through: :issue_assignees, source: :user

  def self.statistics
    group(:state, :assignee_id).count(:state)
  end

  def self.statistics_grouped
    group(:state).having('assignee_id > ?', 0).count(:state)
  end
end
