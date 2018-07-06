Rails.application.routes.draw do
  resources :songs
  resources :playlists
  resources :artists
end
