Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :index]
  resource :session, only: [:new, :create, :destroy]
  resources :goals, except: :index
  resources :comments, only: [:new, :create, :edit, :update, :destroy]
end
