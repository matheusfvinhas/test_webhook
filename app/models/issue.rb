# frozen_string_literal: true

class Issue < ApplicationRecord
  belongs_to :user
  belongs_to :assignee, class_name: 'User', optional: true
  has_many :events
  has_and_belongs_to_many :labels
  has_many :issue_assignees
  has_many :assignees, through: :issue_assignees, source: :user

  def self.statistics(type)
    if type.eql?('grouped')
      return { 'assigned': assigned_issues_grouped, 'unassigned': unassigned_issues_grouped }
    elsif type.eql?('ungrouped')
      return { 'assigned': assigned_issues_grouped, 'unassigned': unassigned_issues_ungrouped }
    end
    raise ActiveRecord::RecordNotFound, 'Type Not Found'
  end

  private

  def self.assigned_issues_grouped
    where('assignee_id is not null').group(:state).count(:state)
  end

  def self.unassigned_issues_grouped
    where('assignee_id is null').group(:state).count(:state)
  end

  def self.unassigned_issues_ungrouped
    where('assignee_id is null').count(:state)
  end
end
