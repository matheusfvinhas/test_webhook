# frozen_string_literal: true

require 'rails_helper'

RSpec.describe IssuesController, type: :request do
  let!(:event) { create(:event) }
  let(:issue_number) { event.issue.number }

  describe 'GET /issues/:id/events' do
    before { get "/issues/#{issue_number}/events" }

    context 'when events exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when events not exists' do
      let(:issue_number) { 100 }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end  
end
