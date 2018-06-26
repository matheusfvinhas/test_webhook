# frozen_string_literal: true

Rails.application.routes.draw do
  resources :events, only: [:create], defaults: { format: 'json' }
  get '/issues/:id/events', to: 'events#index', defaults: { format: 'json' }
  get '/statistics/:type', to: 'statistics#show', defaults: { format: 'json' }
end
