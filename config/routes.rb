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
      # Timeline
      get :timeline

      # Actions-complaint
      get :recieve
      post :recieve, action: :recieved
      get :actions
      #actions-action
      get 'actions/:action_name', action: :action, as: :new_action
      post 'actions/:action_name', action: :do_action, as: :do_action
      #hearing
      get 'hearings/:hid', controller: :hearings,action: :show, as: :hearing
      get :hearings, controller: :hearings,action: :index
      get :add_hearing, controller: :hearings,action: :new
      post :add_hearing, controller: :hearings,action: :create
    end
  end

  get "/dashboard", to: 'dashboard#index', as: :dashboard
  get '/insights', to: 'dashboard#insights', as: :insights
  get '/your_complaints', to: 'complaints#your_complaints', as: :your_complaints

  root to: 'visitors#index'
end
