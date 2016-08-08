Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :index]
  resource :session, only: [:new, :create, :destroy]
  resource :goals, except: :index
end
