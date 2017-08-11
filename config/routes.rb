Rails.application.routes.draw do
  get 'login' => "sessions#index"
  get 'logout' => "sessions#destroy"

  resources :users
  get 'users/index'

  root "homes#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
