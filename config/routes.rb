Rails.application.routes.draw do

  root 'welcome#index'

  resources :artists, shallow: true do
    resources :songs, except: [:index]
  end
  resources :songs, only: [:index]
  resources :playlists
  resources :users, only: [:new, :create, :show]
end
