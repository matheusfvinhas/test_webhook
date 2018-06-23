# frozen_string_literal: true

class CreateIssueAssignees < ActiveRecord::Migration[5.2]
  def change
    create_table :issue_assignees do |t|
      t.references :issue, :user

      t.timestamps
    end
  end
end
