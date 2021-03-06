# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :repository
  belongs_to :sender, class_name: 'User'
  belongs_to :issue

  def self.events(id)
    joins(:issue).where('issues.number': id)
  end
end
