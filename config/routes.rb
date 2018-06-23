# frozen_string_literal: true

Rails.application.routes.draw do
  post '/webhook', to: 'webhook#webhook', defaults: { format: 'json' }
  get '/issues/:id/events', to: 'webhook#events', defaults: { format: 'json' }
  get '/statistics', to: 'webhook#events_statistics', defaults: { format: 'json' }
  get '/statistics_grouped', to: 'webhook#events_statistics_grouped', defaults: { format: 'json' }
end
