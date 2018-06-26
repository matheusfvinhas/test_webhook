# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StatisticsController, type: :request do
  let!(:event) { create_list(:event, 5) }

  after(:all) do
    DatabaseCleaner.clean_with(:truncation)
  end

  describe 'GET /statistics/:type' do
    before { get "/statistics/#{type}" }

    context 'when ungrouped statistics exists' do
      let(:type) { 'ungrouped' }
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when grouped statistics exists' do
      let(:type) { 'grouped' }
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when type not exists' do
      let(:type) { 'test' }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns not found message' do
        expect(response.body).to match(/Type Not Found/)
      end
    end
  end
end
