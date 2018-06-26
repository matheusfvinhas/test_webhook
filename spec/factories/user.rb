# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    login { Faker::Internet.user_name(5..12) }
    id { Faker::Number.number(10) }
    node_id { Faker::Number.number(20) }
    avatar_url { Faker::Internet.url('example.com') }
    gravatar_id { Faker::Number.number(20) }
    url { Faker::Internet.url('example.com') }
    html_url { Faker::Internet.url('example.com') }
    followers_url { Faker::Internet.url('example.com') }
    following_url { Faker::Internet.url('example.com') }
    gists_url { Faker::Internet.url('example.com') }
    starred_url { Faker::Internet.url('example.com') }
    subscriptions_url { Faker::Internet.url('example.com') }
    organizations_url { Faker::Internet.url('example.com') }
    repos_url { Faker::Internet.url('example.com') }
    events_url { Faker::Internet.url('example.com') }
    received_events_url { Faker::Internet.url('example.com') }
    site_admin { Faker::Boolean.boolean }
  end
end
