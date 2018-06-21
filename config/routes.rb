Rails.application.routes.draw do
  root 'users#index'
  
  get 'login', to: 'sessions#login'

  delete 'logout', to: 'sessions#logout'

  post 'auth', to: "sessions#auth"
  # get 'projects/new'

  # get 'projects/create'

  # get 'users/index',to: "users#index"

  # get 'users/login', to: "users#login"

  # get 'users/signup'

  # get 'users/create'

  resources :users, only: [:create, :index, :show, :update]
  get 'signup', to: 'users#signup'
  get 'home', to: "users#home"
  post 'apply', to: "users#apply"
  get 'applied', to: "users#applied"
  get 'approved', to: "users#approved_project"
  get 'decline', to: "users#decline_user"
  get 'close', to: "users#close_project"
  
  resources :projects
  get 'view', to: 'projects#view'
  get 'showappliedproject', to: 'projects#showappliedproject'
  
  get 'formforapplyproject', to: "users#formforapplyproject"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
