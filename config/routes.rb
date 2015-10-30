Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :skip => [:sessions]
  as :user do
    get 'signin' => 'devise/sessions#new', :as => :new_user_session
    post 'signin' => 'devise/sessions#create', :as => :user_session
    get 'signout' => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  resources :complaints do
    collection do
      get :new_public
      post :create_public
      get :unregistered
    end
    member do
      get :recieve
      post :recieve, to: :recieved
    end
  end

  get "/dashboard", to: 'dashboard#index', as: :dashboard
  get '/insights', to: 'dashboard#insights', as: :insights
  get '/your_complaints', to: 'complaints#your_complaints', as: :your_complaints

  root to: 'visitors#index'
end
