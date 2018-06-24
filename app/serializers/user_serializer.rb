# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  def attributes(*args)
    object.attributes.symbolize_keys
  end

  has_many :issues
  has_many :repositories
  has_many :events
end
