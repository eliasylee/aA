Rails.application.routes.draw do
  root 'static_pages#root'

  namespace :api, defaults: {format: :json} do
    resources :todos, only: [:index, :create, :update, :destroy]
  end
end
