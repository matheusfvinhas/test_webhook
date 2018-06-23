class Event < ApplicationRecord
  belongs_to :repository
  belongs_to :sender, class_name: 'User'
  belongs_to :issue
end
