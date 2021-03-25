Rails.application.routes.draw do
  devise_for :users
  root to: "prototypes#index"
  resources :prototypes, only: [:index, :new, :create, :destroy, :show, :update, :edit]
  resources :comments,   only: [:create]
end
