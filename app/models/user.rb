# frozen_string_literal: true

class User < ApplicationRecord
  has_many :issues
  has_many :repositories
end
