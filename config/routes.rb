Rails.application.routes.draw do
root 'sound_treks#index'

get 'session/index'

resources :locations do
  resources :sound_treks, except: [:new]
end

resources :sound_treks, only: [:show]

get 'auth/:provider/callback', to: "sessions#create"
delete 'sign_out', to: "sessions#destroy", as: 'sign_out'

resources :users
resources :ratings, only: [:create, :edit]

resources :playlists, only: [:new, :create, :show]

end
