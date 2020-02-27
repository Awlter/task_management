# frozen_string_literal: true

Rails.application.routes.draw do
  get 'register', to: 'users#new'
  resources :users, only: [:create]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'

  get 'backlog/list', to: 'tasks#index'
  resources :tasks, only: %i[create update destroy]
end
