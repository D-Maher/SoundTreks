Rails.application.routes.draw do
  root 'sound_treks#index'

  get 'session/index'

  resources :sound_treks do
    resources :ratings, only: [:create, :update]
  end

  get 'auth/:provider/callback', to: "sessions#create"
  delete 'sign_out', to: "sessions#destroy", as: 'sign_out'
  resources :about, only: [:index]
  resources :users
end
