Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'articles#index'

  # get
  get 'publish', to: 'articles#publish'
  get 'read', to: 'articles#read'
  get 'edit', to: 'articles#edit'
  get 'status/:status', to: 'articles#index'
  get 'search', to: 'articles#search'
  # post
  post 'publish', to: 'articles#publish'

  #patch
  patch 'update/:id', to: 'articles#update'

  #delete
  delete 'delete', to: 'articles#delete'
end
