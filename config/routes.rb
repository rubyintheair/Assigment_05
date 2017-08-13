Rails.application.routes.draw do
  get 'friendships/new'

  get 'login' => "sessions#new"
  post "login" => "sessions#create"
  get 'logout' => "sessions#destroy"
  get "show" => "users#show"
  get "edit" => "users#edit"
  post "edit" => "user#update"
  get "newfeed" => "user#index"
  get "guest_show" => "homes#show"

  delete "remove_friend" => "friendships#destroy"

  resources :users
  resources :friendships

  root "homes#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
