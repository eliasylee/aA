Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]

  resources :bands, only: [:index, :new, :create, :edit, :update, :show, :destroy] do
    resources :albums, only: [:new, :edit]
  end

  resources :albums, only: [:update, :create, :show, :destroy] do
    resources :tracks, only: [:new, :edit]
  end

  resources :tracks, only: [:create, :update, :show, :destroy] do
    resources :notes, only: [:create]
  end

  resources :notes, only: [:edit, :update, :destroy]
end
