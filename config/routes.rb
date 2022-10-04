Rails.application.routes.draw do
  get 'students/index'
  get 'students/new'
  get 'students/delete'
  get 'students/list'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
