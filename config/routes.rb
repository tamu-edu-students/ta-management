Rails.application.routes.draw do
  resources :managements
  resources :professors
  resources :users
  # get 'students/:id', to: 'students#show', as: 'student'
  # get 'students', to: 'students#index'
  # get 'students/new', to: 'students#new'
  # delete 'students/:id', to: 'students#delete'
  # post 'students/create', to: 'students#create'
  # get 'students/index', to: 'students#index'
  get 'users/user/login', to: 'users#login'
  post 'users/user/login', to: 'users#login'
  resources :students
  resources :subjects
  post 'subjects/assign', to: 'subjects#assign'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
