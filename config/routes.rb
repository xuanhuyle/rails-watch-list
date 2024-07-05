Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  resources :bookmarks, only: [:destroy]
  resources :lists do
    resources :bookmarks, only: [:create, :new]
  end

  root to: 'lists#index'

  # get 'bookmarks/create'
  # get 'bookmarks/destroy'
  # get 'lists/index'
  # get 'lists/show'
  # get 'lists/new'
  # get 'lists/create'
  # get 'movies/index'
  # get 'movies/show'
  # get 'movies/new'
  # get 'movies/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # Defines the root path route ("/")
  # root "lists#index"
end
