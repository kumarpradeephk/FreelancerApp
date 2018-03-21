Rails.application.routes.draw do
  get 'sessions/login', to: 'sessions#login'

  get 'sessions/signup'

  delete 'sessions/logout'

  post 'auth', to: "sessions#auth"
  # get 'projects/new'

  # get 'projects/create'

  # get 'users/index',to: "users#index"

  # get 'users/login', to: "users#login"

  # get 'users/signup'

  # get 'users/create'

  resources :users, only: [:create, :index, :show, :update]
  get 'login', to: 'users#login'
  get 'signup', to: 'users#signup'
  get 'home', to: "users#home"
  
  resources :projects
  get 'view', to: 'projects#view'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
