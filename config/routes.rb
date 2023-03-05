Rails.application.routes.draw do
  # get 'sessions/new'
  resources :managements
  resources :professors
  resources :users
  # get 'students/:id', to: 'students#show', as: 'student'
  # get 'students', to: 'students#index'
  # get 'students/new', to: 'students#new'
  # delete 'students/:id', to: 'students#delete'
  # post 'students/create', to: 'students#create'
  # get 'students/index', to: 'students#index'
  # get 'users/user/login', to: 'users#login'
  # post 'users/user/login', to: 'users#login'
  get 'admin', to: 'users#admin'
  # post 'admin', to: 'users#admin'
  # get 'users/user/home', to: 'users#home'
  # post 'users/user/home', to: 'users#home'
  resources :students do
    get '/page/:page', action: :index, on: :collection
  end
  resources :subjects
  post 'subjects/assign', to: 'subjects#assign'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'signup', to: 'users#new'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :schedules do
    collection do
      post :import
    end
  end

  get 'view', to: 'schedules#view'

  # Defines the root path route ("/")
  root to: "users#home"
end
