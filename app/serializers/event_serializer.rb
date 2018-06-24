# frozen_string_literal: true

class EventSerializer < ActiveModel::Serializer
  attributes :action, :issue, :repository, :sender

  belongs_to :repository
  belongs_to :sender, class_name: 'User'
  belongs_to :issue
end
