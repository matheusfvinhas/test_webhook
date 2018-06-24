# frozen_string_literal: true

class WebhookController < ApplicationController
  def webhook
    @user = User.create_with(user_params).find_or_create_by!(id: params[:issue][:user][:id])
    @assignee = User.create_with(assignee_params).find_or_create_by!(id: params[:issue][:assignee][:id])
    @assignees = []
    assignees_params.each { |assignee| @assignees << User.create_with(assignee).find_or_create_by!(id: assignee[:id]) }
    @labels = []
    labels_params.each { |label| @labels << Label.create_with(label).find_or_create_by!(id: label[:id]) }
    @owner = User.create_with(owner_params).find_or_create_by!(id: params[:repository][:owner][:id])
    @sender = User.create_with(sender_params).find_or_create_by!(id: params[:sender][:id])
    @repository = Repository.create_with(repository_params).find_or_create_by(id: params[:repository][:id])
    @repository.owner = @owner
    @repository.save!

    @issue = Issue.create_with(issue_params).find_or_create_by(id: params[:issue][:id])
    @issue.update(issue_params)
    @issue.user = @user
    @issue.labels = @labels
    @issue.assignee = @assignee
    @issue.assignees = @assignees
    @issue.save

    @event = Event.new(event_params)
    @action = request.raw_post
    @event.action = @action[@action.index(':"') + 2..@action.index('",') - 1]
    @event.issue = @issue
    @event.repository = @repository
    @event.sender = @sender
    @event.save

    json_response({})
  end

  def events
    @events = Event.events(params[:id])
    json_response(@events)
  end

  def events_statistics
    @events = Issue.statistics
    json_response(@events)
  end

  def events_statistics_grouped
    @events = Issue.statistics_grouped
    json_response(@events)
  end

  private

  def user_params
    params.require(:issue).require(:user).permit!
  end

  def assignee_params
    params.require(:issue).require(:assignee).permit!
  end

  def assignees_params
    if !params[:issue][:assignees].empty?
      params.require(:issue).require(:assignees).map(&:permit!)
    else
      []
    end
  end

  def labels_params
    if !params[:issue][:labels].empty?
      params.require(:issue).require(:labels).map(&:permit!)
    else
      []
    end
  end

  def issue_params
    params.require(:issue).permit(:id, :url, :repository_url, :labels_url, :comments_url,
                                  :events_url, :html_url, :node_id, :number, :title, :state, :locked,
                                  :milestone, :comments, :created_at, :updated_at, :closed_at, :author_association, :body)
  end

  def user_params
    params.require(:issue).require(:user).permit!
  end

  def repository_params
    params.require(:repository).permit(:id, :node_id, :name, :full_name, :default, :private, :html_url,
                                       :description, :fork, :url, :forks_url, :keys_url, :collaborators_url, :teams_url, :hooks_url, :issue_events_url,
                                       :events_url, :assignees_url, :branches_url, :tags_url, :blobs_url, :git_tags_url, :git_refs_url, :trees_url,
                                       :statuses_url, :languages_url, :stargazers_url, :contributors_url, :subscribers_url, :subscription_url,
                                       :commits_url, :git_commits_url, :comments_url, :issue_comment_url, :contents_url, :compare_url, :merges_url,
                                       :archive_url, :downloads_url, :issues_url, :pulls_url, :milestones_url, :notifications_url, :labels_url,
                                       :releases_url, :deployments_url, :created_at, :updated_at, :pushed_at, :git_url, :ssh_url, :clone_url,
                                       :svn_url, :homepage, :size, :stargazers_count, :watchers_count, :language, :has_issues, :has_projects,
                                       :has_downloads, :has_wiki, :has_pages, :forks_count, :mirror_url, :archived, :open_issues_count,
                                       :license, :forks, :open_issues, :watchers, :default_branch)
  end

  def owner_params
    params.require(:repository).require(:owner).permit!
  end

  def sender_params
    params.require(:sender).permit!
  end

  def event_params
    params.permit(:action)
  end
end
