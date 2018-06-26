# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StatisticsController, type: :request do
  let!(:event) { create(:event) }

  describe 'GET /statistics/:type' do
    before { get '/statistics/ungrouped' }

    context 'when ungrouped statistics exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'GET /statistics/:type' do
    before { get '/statistics/grouped' }

    context 'when grouped statistics_grouped exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
end
