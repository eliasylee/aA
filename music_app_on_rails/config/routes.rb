Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]

  resources :bands, only: [:index, :new, :create, :edit, :update, :show, :destroy] do
    resources :albums, only: [:new, :edit]
  end

  resources :albums, only: [:create, :show, :destroy] do
    resources :tracks, only: [:new, :edit]
  end

  resources :tracks, only: [:create, :show, :destroy]
end
