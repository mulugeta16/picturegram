Rails.application.routes.draw do
  root "users#index"
  get 'users/index'
  get 'users/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :users
  resources :pictures
  resources :favorites, only: [:create, :destroy, :index]

  resources :pictures do
    collection do
    post :confirm
    end
  end

  
end
