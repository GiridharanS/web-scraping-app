# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/index'
  resources :products
  resources :categories
  resources :restaurants
  resources :locations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  post 'home/scrape', to: 'home#scrape', as: :scrape
  root 'home#index'
end
