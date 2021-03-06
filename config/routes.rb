Yeshi::Application.routes.draw do
  use_doorkeeper

  constraints subdomain: ENV['SUBDOMAIN'] do
    resources :nodes do
      resources :topics, only: [:new, :create]
    end
    resources :sections
    resources :topics do
      resources :replies
    end
    resources :articles, only: [:index, :show] do
      get '/tags/:tag', to: 'articles#tag', as: :tag, on: :collection
      get '/tags', to: 'articles#tags', as: :tags, on: :collection
      resources :comments, only: [:index,:create]
    end
    get '/categories/:category', to: 'commodities#category', as: :category
    get '/categories', to: 'commodities#categories', as: :categories
    resources :posts, only: [:index, :show] do
      get :ajax, on: :collection
      resources :comments, only: [:index,:create]
    end
    resources :comments, only: [:index, :show, :create]
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
      resources :comments, only: [:index,:create]
    end

    resources :locations, only: [:index]
    resources :commodities, only: [:index, :show] do
      resources :comments, only: [:index,:create]
    end
    authenticated :user do
      root :to => 'home#index'
    end
    root :to => "home#index"
    get '/contact', :to => "home#contact", as: :system_contact
    get '/download', :to => "home#download", as: :download
  end

  constraints subdomain: ENV['USER_SUBDOMAIN'] do
    devise_for :users, controllers: {
      omniauth_callbacks: :authentications,
      registrations: 'users/registrations',
      sessions: 'users/sessions'
    }
    scope module: 'user' do
      root to: 'home#index', as: :user_home
      #get 'authentications', to: 'home#authentications', as: :user_authentications
      resources :posts do
        get :ajax, on: :collection
      end
      resources :authentications
      resources :chat_messages, only: [:new, :create], as: :user_chat_messages
      resources :got_chat_messages, only: [:index, :show, :destroy], as: :user_got_chat_messages
      resources :commodities, only: [:index, :show] do
        resources :chat_messages, only: [:new, :create]
      end

      resources :comments, only: [:index, :destroy]
      resources :mp_users

    end
  end

  constraints subdomain: ENV['TRADER_SUBDOMAIN'] do
    #devise_for :users
    scope module: 'trader' do
      resources :contacts, except: [:show]
      resources :traders, only: [:index, :create, :update]
      resources :locations, except: [:edit, :update]
      resources :groups do
        resources :commodities
        get :bulk_add, on: :member
        put :bulk_add_commodities, on: :member
      end
      resources :pictures
      resources :bills, except: [:new, :show] do
        get :dashboard, on: :collection
      end
      resources :commodities, except: [:new] do
        resources :bills, only: [:index, :new]
      end
      root :to => 'home#index', as: :trader_home
      get '/dashboard' => 'bills#dashboard'
    end
  end

  constraints subdomain: ENV['ADMIN_SUBDOMAIN'] do
    scope module: 'admin' do
      resources :articles do
        post :publish, on: :member
      end
      resources :apks do
        get :updated_version, on: :member
      end
      resources :users
      resources :ads
      resources :comments
    end
  end

  constraints subdomain: ENV['API_SUBDOMAIN'] do
    scope module: 'api' do
      namespace :v1 do
        # another api routes
        get '/me' => "credentials#me"
        get '/dashboard' => "credentials#dashboard"
        post '/reg' => "registrations#create"
        #post '/test' => "registrations#test"
        resources :got_chat_messages, only: [:index, :show, :destroy]
        resources :chat_messages, only: [:create]
        resources :locations, only: [:index, :create, :destroy]
        resources :business_hours, only: [:index, :create, :update, :destroy]
        resources :groups, only: [:index, :create, :update, :destroy, :show] do
          resources :commodities, only: [:index, :create]
          put :bulk_add_commodities, on: :member
        end

        resources :commodities, only: [:index, :create, :update, :destroy, :show] do
          resources :bills
        end
        resources :bills, only: :index do
          get :dashboard, on: :collection
        end
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

  constraints subdomain: ENV['MP_SUBDOMAIN'] do
    scope module: 'mp' do
      root to: 'home#index', as: :mp, via: [:get]
      post '/' => "home#create"
    end
  end

end
