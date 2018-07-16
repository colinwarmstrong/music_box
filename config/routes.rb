Rails.application.routes.draw do

  root 'welcome#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  # get '/logout'

  resources :artists, shallow: true do
    resources :songs, except: [:index]
  end
  resources :songs, only: [:index]
  resources :playlists
  resources :users, only: [:new, :create, :show]
end
