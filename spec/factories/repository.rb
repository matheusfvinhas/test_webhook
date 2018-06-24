# frozen_string_literal: true

FactoryBot.define do
  factory :repository do
    id { Faker::Number.number(10) }
    node_id { Faker::Number.number(20) }
    name { Faker::Lorem.word }
    full_name { Faker::Lorem.word }
    default { Faker::Lorem.word }
    private { Faker::Boolean.boolean }
    html_url { Faker::Internet.url('example.com') }
    description { Faker::Lorem.word }
    fork { Faker::Boolean.boolean }
    url { Faker::Internet.url('example.com') }
    forks_url { Faker::Internet.url('example.com') }
    keys_url { Faker::Internet.url('example.com') }
    collaborators_url { Faker::Internet.url('example.com') }
    teams_url { Faker::Internet.url('example.com') }
    hooks_url { Faker::Internet.url('example.com') }
    issue_events_url { Faker::Internet.url('example.com') }
    events_url { Faker::Internet.url('example.com') }
    assignees_url { Faker::Internet.url('example.com') }
    branches_url { Faker::Internet.url('example.com') }
    tags_url { Faker::Internet.url('example.com') }
    blobs_url { Faker::Internet.url('example.com') }
    git_tags_url { Faker::Internet.url('example.com') }
    git_refs_url { Faker::Internet.url('example.com') }
    trees_url { Faker::Internet.url('example.com') }
    statuses_url { Faker::Internet.url('example.com') }
    languages_url { Faker::Internet.url('example.com') }
    stargazers_url { Faker::Internet.url('example.com') }
    contributors_url { Faker::Internet.url('example.com') }
    subscribers_url { Faker::Internet.url('example.com') }
    subscription_url { Faker::Internet.url('example.com') }
    commits_url { Faker::Internet.url('example.com') }
    git_commits_url { Faker::Internet.url('example.com') }
    comments_url { Faker::Internet.url('example.com') }
    issue_comment_url { Faker::Internet.url('example.com') }
    contents_url { Faker::Internet.url('example.com') }
    compare_url { Faker::Internet.url('example.com') }
    merges_url { Faker::Internet.url('example.com') }
    archive_url { Faker::Internet.url('example.com') }
    downloads_url { Faker::Internet.url('example.com') }
    issues_url { Faker::Internet.url('example.com') }
    pulls_url { Faker::Internet.url('example.com') }
    milestones_url { Faker::Internet.url('example.com') }
    notifications_url { Faker::Internet.url('example.com') }
    labels_url { Faker::Internet.url('example.com') }
    releases_url { Faker::Internet.url('example.com') }
    deployments_url { Faker::Internet.url('example.com') }
    created_at { Faker::Date.between(2.days.ago, Date.today) }
    updated_at { Faker::Date.between(2.days.ago, Date.today) }
    pushed_at { Faker::Date.between(2.days.ago, Date.today) }
    git_url { Faker::Internet.url('example.com') }
    ssh_url { Faker::Internet.url('example.com') }
    clone_url { Faker::Internet.url('example.com') }
    svn_url { Faker::Internet.url('example.com') }
    homepage { Faker::Internet.url('example.com') }
    size { Faker::Number.number(2) }
    stargazers_count { Faker::Number.number(2) }
    watchers_count { Faker::Number.number(2) }
    language { Faker::Lorem.word }
    has_issues { Faker::Boolean.boolean }
    has_projects { Faker::Boolean.boolean }
    has_downloads { Faker::Boolean.boolean }
    has_wiki { Faker::Boolean.boolean }
    has_pages { Faker::Boolean.boolean }
    forks_count { Faker::Number.number(2) }
    mirror_url { Faker::Internet.url('example.com') }
    archived { Faker::Boolean.boolean }
    open_issues_count { Faker::Number.number(2) }
    license { Faker::Lorem.word }
    forks { Faker::Number.number(2) }
    open_issues { Faker::Number.number(2) }
    watchers { Faker::Number.number(2) }
    default_branch { Faker::Lorem.word }
    association :owner, factory: :user
  end
end
