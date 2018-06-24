# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WebhookController, type: :request do
  let!(:event) { create(:event) }

  describe 'GET /issues/:id/events' do
    before { get "/issues/#{event.issue.number}/events" }

    context 'when events exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'GET /statistics' do
    before { get '/statistics' }

    context 'when statistics exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'GET /statistics_grouped' do
    before { get '/statistics_grouped' }

    context 'when statistics_grouped exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'POST /webhook' do
    params = {
      "action": 'closed',
      "issue": {
        "url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/issues/1',
        "repository_url": 'https://api.github.com/repos/matheusfvinhas/test_webhook',
        "labels_url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/issues/1/labels{/name}',
        "comments_url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/issues/1/comments',
        "events_url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/issues/1/events',
        "html_url": 'https://github.com/matheusfvinhas/test_webhook/issues/1',
        "id": 334_954_052,
        "node_id": 'MDU6SXNzdWUzMzQ5NTQwNTI=',
        "number": 1,
        "title": 'Create project',
        "user": {
          "login": 'matheusfvinhas',
          "id": 3_107_158,
          "node_id": 'MDQ6VXNlcjMxMDcxNTg=',
          "avatar_url": 'https://avatars3.githubusercontent.com/u/3107158?v=4',
          "gravatar_id": '',
          "url": 'https://api.github.com/users/matheusfvinhas',
          "html_url": 'https://github.com/matheusfvinhas',
          "followers_url": 'https://api.github.com/users/matheusfvinhas/followers',
          "following_url": 'https://api.github.com/users/matheusfvinhas/following{/other_user}',
          "gists_url": 'https://api.github.com/users/matheusfvinhas/gists{/gist_id}',
          "starred_url": 'https://api.github.com/users/matheusfvinhas/starred{/owner}{/repo}',
          "subscriptions_url": 'https://api.github.com/users/matheusfvinhas/subscriptions',
          "organizations_url": 'https://api.github.com/users/matheusfvinhas/orgs',
          "repos_url": 'https://api.github.com/users/matheusfvinhas/repos',
          "events_url": 'https://api.github.com/users/matheusfvinhas/events{/privacy}',
          "received_events_url": 'https://api.github.com/users/matheusfvinhas/received_events',
          "type": 'User',
          "site_admin": false
        },
        "labels": [
          {
            "id": 972_569_512,
            "node_id": 'MDU6TGFiZWw5NzI1Njk1MTI=',
            "url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/labels/good%20first%20issue',
            "name": 'good first issue',
            "color": '7057ff',
            "default": true
          }
        ],
        "state": 'closed',
        "locked": false,
        "assignee": {
          "login": 'matheusfvinhas',
          "id": 3_107_158,
          "node_id": 'MDQ6VXNlcjMxMDcxNTg=',
          "avatar_url": 'https://avatars3.githubusercontent.com/u/3107158?v=4',
          "gravatar_id": '',
          "url": 'https://api.github.com/users/matheusfvinhas',
          "html_url": 'https://github.com/matheusfvinhas',
          "followers_url": 'https://api.github.com/users/matheusfvinhas/followers',
          "following_url": 'https://api.github.com/users/matheusfvinhas/following{/other_user}',
          "gists_url": 'https://api.github.com/users/matheusfvinhas/gists{/gist_id}',
          "starred_url": 'https://api.github.com/users/matheusfvinhas/starred{/owner}{/repo}',
          "subscriptions_url": 'https://api.github.com/users/matheusfvinhas/subscriptions',
          "organizations_url": 'https://api.github.com/users/matheusfvinhas/orgs',
          "repos_url": 'https://api.github.com/users/matheusfvinhas/repos',
          "events_url": 'https://api.github.com/users/matheusfvinhas/events{/privacy}',
          "received_events_url": 'https://api.github.com/users/matheusfvinhas/received_events',
          "type": 'User',
          "site_admin": false
        },
        "assignees": [
          {
            "login": 'matheusfvinhas',
            "id": 3_107_158,
            "node_id": 'MDQ6VXNlcjMxMDcxNTg=',
            "avatar_url": 'https://avatars3.githubusercontent.com/u/3107158?v=4',
            "gravatar_id": '',
            "url": 'https://api.github.com/users/matheusfvinhas',
            "html_url": 'https://github.com/matheusfvinhas',
            "followers_url": 'https://api.github.com/users/matheusfvinhas/followers',
            "following_url": 'https://api.github.com/users/matheusfvinhas/following{/other_user}',
            "gists_url": 'https://api.github.com/users/matheusfvinhas/gists{/gist_id}',
            "starred_url": 'https://api.github.com/users/matheusfvinhas/starred{/owner}{/repo}',
            "subscriptions_url": 'https://api.github.com/users/matheusfvinhas/subscriptions',
            "organizations_url": 'https://api.github.com/users/matheusfvinhas/orgs',
            "repos_url": 'https://api.github.com/users/matheusfvinhas/repos',
            "events_url": 'https://api.github.com/users/matheusfvinhas/events{/privacy}',
            "received_events_url": 'https://api.github.com/users/matheusfvinhas/received_events',
            "type": 'User',
            "site_admin": false
          }
        ],
        "milestone": nil,
        "comments": 0,
        "created_at": '2018-06-22T17:09:55Z',
        "updated_at": '2018-06-23T14:03:48Z',
        "closed_at": '2018-06-23T14:03:48Z',
        "author_association": 'OWNER',
        "body": ''
      },
      "repository": {
        "id": 138_328_504,
        "node_id": 'MDEwOlJlcG9zaXRvcnkxMzgzMjg1MDQ=',
        "name": 'test_webhook',
        "full_name": 'matheusfvinhas/test_webhook',
        "owner": {
          "login": 'matheusfvinhas',
          "id": 3_107_158,
          "node_id": 'MDQ6VXNlcjMxMDcxNTg=',
          "avatar_url": 'https://avatars3.githubusercontent.com/u/3107158?v=4',
          "gravatar_id": '',
          "url": 'https://api.github.com/users/matheusfvinhas',
          "html_url": 'https://github.com/matheusfvinhas',
          "followers_url": 'https://api.github.com/users/matheusfvinhas/followers',
          "following_url": 'https://api.github.com/users/matheusfvinhas/following{/other_user}',
          "gists_url": 'https://api.github.com/users/matheusfvinhas/gists{/gist_id}',
          "starred_url": 'https://api.github.com/users/matheusfvinhas/starred{/owner}{/repo}',
          "subscriptions_url": 'https://api.github.com/users/matheusfvinhas/subscriptions',
          "organizations_url": 'https://api.github.com/users/matheusfvinhas/orgs',
          "repos_url": 'https://api.github.com/users/matheusfvinhas/repos',
          "events_url": 'https://api.github.com/users/matheusfvinhas/events{/privacy}',
          "received_events_url": 'https://api.github.com/users/matheusfvinhas/received_events',
          "type": 'User',
          "site_admin": false
        },
        "private": false,
        "html_url": 'https://github.com/matheusfvinhas/test_webhook',
        "description": nil,
        "fork": false,
        "url": 'https://api.github.com/repos/matheusfvinhas/test_webhook',
        "forks_url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/forks',
        "keys_url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/keys{/key_id}',
        "collaborators_url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/collaborators{/collaborator}',
        "teams_url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/teams',
        "hooks_url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/hooks',
        "issue_events_url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/issues/events{/number}',
        "events_url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/events',
        "assignees_url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/assignees{/user}',
        "branches_url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/branches{/branch}',
        "tags_url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/tags',
        "blobs_url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/git/blobs{/sha}',
        "git_tags_url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/git/tags{/sha}',
        "git_refs_url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/git/refs{/sha}',
        "trees_url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/git/trees{/sha}',
        "statuses_url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/statuses/{sha}',
        "languages_url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/languages',
        "stargazers_url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/stargazers',
        "contributors_url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/contributors',
        "subscribers_url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/subscribers',
        "subscription_url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/subscription',
        "commits_url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/commits{/sha}',
        "git_commits_url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/git/commits{/sha}',
        "comments_url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/comments{/number}',
        "issue_comment_url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/issues/comments{/number}',
        "contents_url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/contents/{+path}',
        "compare_url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/compare/{base}...{head}',
        "merges_url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/merges',
        "archive_url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/{archive_format}{/ref}',
        "downloads_url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/downloads',
        "issues_url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/issues{/number}',
        "pulls_url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/pulls{/number}',
        "milestones_url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/milestones{/number}',
        "notifications_url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/notifications{?since,all,participating}',
        "labels_url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/labels{/name}',
        "releases_url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/releases{/id}',
        "deployments_url": 'https://api.github.com/repos/matheusfvinhas/test_webhook/deployments',
        "created_at": '2018-06-22T17:09:17Z',
        "updated_at": '2018-06-23T13:01:21Z',
        "pushed_at": '2018-06-23T13:01:19Z',
        "git_url": 'git://github.com/matheusfvinhas/test_webhook.git',
        "ssh_url": 'git@github.com:matheusfvinhas/test_webhook.git',
        "clone_url": 'https://github.com/matheusfvinhas/test_webhook.git',
        "svn_url": 'https://github.com/matheusfvinhas/test_webhook',
        "homepage": nil,
        "size": 19,
        "stargazers_count": 0,
        "watchers_count": 0,
        "language": 'Ruby',
        "has_issues": true,
        "has_projects": true,
        "has_downloads": true,
        "has_wiki": true,
        "has_pages": false,
        "forks_count": 0,
        "mirror_url": nil,
        "archived": false,
        "open_issues_count": 0,
        "license": nil,
        "forks": 0,
        "open_issues": 0,
        "watchers": 0,
        "default_branch": 'master'
      },
      "sender": {
        "login": 'matheusfvinhas',
        "id": 3_107_158,
        "node_id": 'MDQ6VXNlcjMxMDcxNTg=',
        "avatar_url": 'https://avatars3.githubusercontent.com/u/3107158?v=4',
        "gravatar_id": '',
        "url": 'https://api.github.com/users/matheusfvinhas',
        "html_url": 'https://github.com/matheusfvinhas',
        "followers_url": 'https://api.github.com/users/matheusfvinhas/followers',
        "following_url": 'https://api.github.com/users/matheusfvinhas/following{/other_user}',
        "gists_url": 'https://api.github.com/users/matheusfvinhas/gists{/gist_id}',
        "starred_url": 'https://api.github.com/users/matheusfvinhas/starred{/owner}{/repo}',
        "subscriptions_url": 'https://api.github.com/users/matheusfvinhas/subscriptions',
        "organizations_url": 'https://api.github.com/users/matheusfvinhas/orgs',
        "repos_url": 'https://api.github.com/users/matheusfvinhas/repos',
        "events_url": 'https://api.github.com/users/matheusfvinhas/events{/privacy}',
        "received_events_url": 'https://api.github.com/users/matheusfvinhas/received_events',
        "type": 'User',
        "site_admin": false
      }
    }

    context 'when the request is valid' do
      before { post '/webhook', params: params }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
end
