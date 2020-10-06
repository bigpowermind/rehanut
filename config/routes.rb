Rails.application.routes.draw do
  devise_for :users

  root "contents#index"
  resources :users, only: [:edit, :update]
  resources :contents, only: [:new, :create, :edit, :update:] do
    # 投稿されたメッセージの一覧表示とメッセージの入力ができる:index,メッセージの保存を行う:create
    resources :comments, only: [:index, :create]
    member do
      get "nut"
    end
  end
end
