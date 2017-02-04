Rails.application.routes.draw do
  get 'locations/new'

  get 'locations/create'

  get 'session/index'

  root 'sound_treks#index'


resources :users, only:[:show]

resources :locations do
  resources :sound_treks
end

resources :sound_treks, only: [:show]

get 'auth/spotify/callback', to: "sessions#create"
delete 'sign_out', to: "sessions#destroy", as: 'sign_out'

resources :users
resources :playlists, only: [:new, :create, :show]
resources :soundtreks

end
