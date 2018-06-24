# frozen_string_literal: true

class IssueAssigneeSerializer < ActiveModel::Serializer
  def attributes(*_args)
    object.attributes.symbolize_keys
  end

  belongs_to :issue
  belongs_to :user
end
