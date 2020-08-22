Rails.application.routes.draw do
  devise_for :users

  root "contents#index"
  resources :users, only: [:edit, :update]
  resources :contents, only: [:index, :show] do
    member do
      get "nut"
    end
  end
end
