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
      get :recieve, controller: :actions, action: :recieve
      post :recieve, controller: :actions, action: :recieved
      get :actions, controller: :actions, action: :index
      #actions-action
      get 'actions/:action_name', controller: :actions, action: :new,as: :new_action
      post 'actions/:action_name', controller: :actions, action: :create, as: :do_action
      #hearing
      get 'hearings/:hid', controller: :hearings,action: :show, as: :hearing
      get :hearings, controller: :hearings,action: :index
      get :add_hearing, controller: :hearings,action: :new
      post :add_hearing, controller: :hearings,action: :create

      get :status

      #police actions
      # update_status_report
      # update summons
      # add fir number and details - 1 time
      # update report file
      # add investigation process
      # a
    end
  end

  get "/dashboard", to: 'dashboard#index', as: :dashboard
  get '/insights', to: 'dashboard#insights', as: :insights
  get '/your_complaints', to: 'complaints#your_complaints', as: :your_complaints
  
  get '/search', to: 'complaints#public_search', as: :public_search
  post '/search', to: 'complaints#do_public_search'

  root to: 'visitors#index'
end
