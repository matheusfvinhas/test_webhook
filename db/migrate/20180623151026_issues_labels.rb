# frozen_string_literal: true

class IssuesLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :issues_labels do |t|
      t.references :issue, :label

      t.timestamps
    end
  end
end
