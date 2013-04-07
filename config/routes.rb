Yeshi::Application.routes.draw do

  devise_for :traders

  resources :groups do
    resources :commodities, only: [:index]
  end
  resources :pictures
  resources :commodities
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  get '/contact', :to => "home#contact"
  devise_for :users
  resources :users
end
