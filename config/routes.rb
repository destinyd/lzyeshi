Yeshi::Application.routes.draw do
  use_doorkeeper

  constraints subdomain: ENV['SUBDOMAIN'] do
    resources :notifications ,except: [:edit,:update,:new,:create] do
      get :read,on: :collection
      #member do 
      #post :accept
      #post :deny
      #end
    end

    resources :chat_messages, only: [:new, :create]
    resources :got_chat_messages, only: [:index, :show, :destroy]
    resources :traders, only: [:index, :show, :create] do
      get :contact, to: 'traders#contact', on: :member
      resources :locations, only: [:index]
      resources :commodities, only: [:index]
      resources :groups, only: [:index]
    end
    resources :groups, only: [:index, :show] do
      resources :commodities, only: [:index]
    end
    #resources :pictures
    resources :locations, only: [:index]
    resources :commodities, only: [:index, :show] do
      resources :chat_messages, only: [:new, :create]
    end
    authenticated :user do
      root :to => 'home#index'
    end
    root :to => "home#index"
    get '/contact', :to => "home#contact", as: :system_contact
    get '/download', :to => "home#download", as: :download
    devise_for :users
  end

  constraints subdomain: ENV['TRADER_SUBDOMAIN'] do
    #devise_for :users
    scope module: 'trader' do
      resources :contacts, except: [:show]
      resources :traders, only: [:index, :create, :update]
      resources :locations, except: [:edit, :update]
      resources :groups do
        resources :commodities
      end
      resources :pictures
      resources :bills, except: [:new, :show] do
        get :dashboard, on: :collection
      end
      resources :commodities, except: [:new] do
        resources :bills, only: [:index, :new]
      end
      root :to => 'home#index'
      get '/dashboard' => 'bills#dashboard'
    end
  end

  constraints subdomain: ENV['ADMIN_SUBDOMAIN'] do
    resources :users
  end

  constraints subdomain: ENV['API_SUBDOMAIN'] do
    scope module: 'api' do
      namespace :v1 do
        # another api routes
        #get '/me' => "credentials#me"
        #get '/dashboard' => "credentials#dashboard"
        #post '/reg' => "registrations#create"
        #post '/test' => "registrations#test"
        resources :got_chat_messages, only: [:index, :show, :destroy]
        resources :chat_messages, only: [:create]
        #resources :notifications ,except: [:edit,:update,:new,:create] do
          #get :read,on: :collection
          #get :status,on: :collection
          #member do 
            #post :accept
            #post :deny
          #end
        #end
      end
    end
  end

end
