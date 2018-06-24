# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    id { Faker::Number.number(10) }
    action %w[assigned unassigned labeled unlabeled opened edited milestoned demilestoned closed reopened].sample
    association :repository, factory: :repository
    association :sender, factory: :user
    association :issue, factory: :issue
  end
end
