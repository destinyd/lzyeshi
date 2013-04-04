Yeshi::Application.routes.draw do
  resources :groups do
    resources :commodities, only: [:index]
  end
  resources :pictures
  resources :commodities
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end
