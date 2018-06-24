# frozen_string_literal: true

class LabelSerializer < ActiveModel::Serializer
  def attributes(*args)
    object.attributes.symbolize_keys
  end
end
