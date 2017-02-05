Rails.application.routes.draw do
  get 'session/index'

  root 'sound_treks#index'

  resources :users, only:[:show]

  get 'auth/spotify/callback', to: "sessions#create"
  delete 'sign_out', to: "sessions#destroy", as: 'sign_out'

end
