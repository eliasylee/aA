Rails.application.routes.draw do
  resources :users, :only => [:index, :show, :create, :update, :destroy]

  resources :contacts, :only => [:index, :show, :create, :update, :destroy]

  resources :contact_shares, :only => [:index, :show, :create, :update, :destroy]
end
