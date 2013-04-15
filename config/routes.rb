Yeshi::Application.routes.draw do
  use_doorkeeper
  constraints subdomain: "admin#{"." + ENV['SUBDOMAIN'] unless ENV['SUBDOMAIN'].blank? }" do

    resources :users
  end

  constraints subdomain: "trader#{"." + ENV['SUBDOMAIN'] unless ENV['SUBDOMAIN'].blank? }" do
    #devise_for :users
    scope module: 'trader' do
      resources :traders,only: [:index, :create, :update]
      resources :locations
      resources :groups do
        resources :commodities
      end
      resources :pictures
      resources :commodities
      root :to => 'home#index'
      get '/dashboard' => 'home#dashboard'
    end
  end

  constraints subdomain: ENV['SUBDOMAIN'] do
    resources :locations
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
  end
end
