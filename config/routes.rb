Rails.application.routes.draw do

  root 'home#top'
  get 'home/about'
  get 'search/search'

  devise_for :users

  resources :users, only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create,:destroy]
    get :follows, on: :member #フォロー一覧
    get :followers, on: :member #フォロワー一覧
  end
  resources :books, only: [:show,:index,:new,:create,:edit,:update,:destroy] do
    resource :favorites, only: [:create,:destroy]
    resource :book_comments, only: [:create,:destroy]
  end

end
