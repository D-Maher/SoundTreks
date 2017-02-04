Rails.application.routes.draw do
  get 'session/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'sound_treks#index'

  resources :users, only:[:show]

  get 'auth/spotify/callback', to: "sessions#create"
  delete 'sign_out', to: "sessions#destroy", as: 'sign_out'

end
