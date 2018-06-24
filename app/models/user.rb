# frozen_string_literal: true

class User < ApplicationRecord
  has_many :issues
  has_many :repositories, foreign_key: 'owner_id'
  has_many :events, foreign_key: 'sender_id'
end
