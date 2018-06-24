# frozen_string_literal: true

FactoryBot.define do
  factory :issue do
    id { Faker::Number.number(10) }
    url { Faker::Internet.url('example.com') }
    repository_url { Faker::Internet.url('example.com') }
    labels_url { Faker::Internet.url('example.com') }
    comments_url { Faker::Internet.url('example.com') }
    events_url { Faker::Internet.url('example.com') }
    html_url { Faker::Internet.url('example.com') }
    node_id { Faker::Number.number(20) }
    number { Faker::Number.number(2) }
    title { Faker::Lorem.word }
    association :user, factory: :user
    association :assignee, factory: :user
    state %w[closed open].sample
    locked { Faker::Boolean.boolean }
    milestone nil
    comments { Faker::Number.number(10) }
    created_at { Faker::Date.between(2.days.ago, Date.today) }
    updated_at { Faker::Date.between(2.days.ago, Date.today) }
    closed_at { Faker::Date.between(2.days.ago, Date.today) }
    author_association { Faker::Lorem.word }
    body { Faker::Lorem.word }
  end
end
