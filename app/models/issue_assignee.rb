# frozen_string_literal: true

class IssueAssignee < ApplicationRecord
  belongs_to :issue
  belongs_to :assignee, class_name: 'User'
end
