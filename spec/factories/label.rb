# frozen_string_literal: true

FactoryBot.define do
  factory :label do
    id { Faker::Number.number(10) }
    node_id { Faker::Number.number(20) }
    url { Faker::Internet.url('example.com') }
    name ['Bug', 'Help Wanted'].sample
    color Faker::Color.color_name
    default { Faker::Boolean.boolean }
  end
end
