Rails.application.routes.draw do
  resources :users, only: [:create, :destroy, :new] do
    resources :posts, only: :index
  end

  resource :session, only: [:create, :destroy, :new]
  resources :subs, except: :destroy
  resources :posts, except: [:index] do
    resources :comments, only: [:create, :new]
  end

  resources :comments, except: [:create, :new]
end
