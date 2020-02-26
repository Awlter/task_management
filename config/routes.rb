# frozen_string_literal: true

Rails.application.routes.draw do
  get 'backlog/list', to: 'tasks#index'
  resources :tasks, only: %i[create update destroy]
end
