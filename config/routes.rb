Rails.application.routes.draw do
  resources :messages
  resources :announcements
  resources :students
  get 'profile', to: 'profile#index'
  get 'profile/change_password'
  patch 'profile/update_password'
  resources :users, path: 'user'
  devise_for :users
  get 'users/:id' => 'users#show'
  get 'home/index'
  root 'home#index'

  namespace :api do
    namespace :v1 do
      get 'auth/connection_test'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
