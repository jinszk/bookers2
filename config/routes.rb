Rails.application.routes.draw do
  get 'home/top' => 'home#top'
  get 'home/about' => 'home#about'

  root 'home#top'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :index, :edit, :update]
  resources :books, only: [:create, :index, :show, :edit, :update ,:destroy]

end