Rails.application.routes.draw do
  root "pictures#index"
  resources :pictures
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
    resources :favorites, only: [:create, :destroy, :index]
  resources :pictures do
    collection do
    post :confirm
    end
  end
end
