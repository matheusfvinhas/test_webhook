# frozen_string_literal: true

class EventsController < ApplicationController
  def create
    create_event
    json_response({})
  end

  def index
    @events = Event.events(params[:id])
    raise ActiveRecord::RecordNotFound, 'Not Found' if @events.empty?
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
    !params[:issue][:assignees].empty? ? params.require(:issue).require(:assignees).map(&:permit!) : []
  end

  def labels_params
    !params[:issue][:labels].empty? ? params.require(:issue).require(:labels).map(&:permit!) : []
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

  def create_issue
    @issue = Issue.create_with(issue_params).find_or_create_by(id: params[:issue][:id])
    # update state and other outer attributes
    @issue.update(issue_params)

    @issue.user = create_user
    @issue.labels = create_labels
    @issue.assignee = create_assignee
    @issue.assignees = create_assignees
    @issue.save!
    @issue
  end

  def create_user
    User.create_with(user_params).find_or_create_by!(id: params[:issue][:user][:id])
  end

  def create_labels
    labels_params.map { |label| Label.create_with(label).find_or_create_by!(id: label[:id]) }
  end

  def create_assignees
    assignees_params.map { |assignee| User.create_with(assignee).find_or_create_by!(id: assignee[:id]) }
  end

  def create_assignee
    params[:issue][:assignee].nil? ? nil : User.create_with(assignee_params).find_or_create_by!(id: params[:issue][:assignee][:id])
  end

  def create_repository
    @repository = Repository.create_with(repository_params).find_or_create_by(id: params[:repository][:id])

    @repository.owner = create_owner
    @repository.save!
    @repository
  end

  def create_owner
    User.create_with(owner_params).find_or_create_by!(id: params[:repository][:owner][:id])
  end

  def create_event
    # @event = Event.new(action: get_action)
    @event = Event.new(event_params)

    @event.issue = create_issue
    @event.repository = create_repository
    @event.sender = create_sender
    @event.save
  end

  def create_sender
    User.create_with(sender_params).find_or_create_by!(id: params[:sender][:id])
  end

  def get_action
    @request = request.raw_post
    @request[@request.index(':"') + 2..@request.index('",') - 1]
  end
end
