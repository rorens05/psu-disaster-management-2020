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
      get 'auth/validate_id_number'
      post 'auth/login'
      post 'auth/register'
      post 'auth/register'
      get 'auth/profile'
      get 'announcements/index'
      post 'announcements/read_announcement'
      post 'messages' => 'messages#create'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
