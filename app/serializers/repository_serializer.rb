# frozen_string_literal: true

class RepositorySerializer < ActiveModel::Serializer
  def attributes(*_args)
    object.attributes.symbolize_keys
  end

  belongs_to :owner, class_name: 'User'
  has_many :events
end
