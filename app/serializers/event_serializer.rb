# frozen_string_literal: true

class EventSerializer < ActiveModel::Serializer
  def attributes(*_args)
    object.attributes.symbolize_keys
  end

  belongs_to :repository
  belongs_to :sender, class_name: 'User'
  belongs_to :issue
end
