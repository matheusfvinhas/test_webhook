# frozen_string_literal: true

class Repository < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :events
end
