Rails.application.routes.draw do
  # resources :collaberations
  # resources :users
  # resources :documents
  # resources :chapters
  # resources :books
  # resources :projects

  # Projects
  get 'projects/index/:user_id' , to: "projects#index"
  get 'projects/:id' , to: 'projects#show'
  post 'projects', to: 'projects#create'
  patch 'projects/:id' , to: 'projects#create'
  delete 'projects/:id' , to: 'projects#delete'

  # Documents
  get 'projects/:project_id/documents', to: 'documents#index'
  get 'documents/:id' , to: 'documents#show'
  post 'documents/' , to: 'documents#create'
  patch 'documents/:id' , to: 'documents#update'
  delete 'documents/:id' , to: 'documents#delete'

  # Books
  get 'projects/:project_id/books' , to: 'books#index'
  get 'book/:id' , to: 'books#show'
  post 'books/' , to: 'books#create'
  patch 'books/:id' , to: 'books#update'
  delete 'books/:id' , to: 'books#delete'

  # Collaberations
  get 'projects/collaberations/:project_id/collaberations' , to: 'collaberations#index'
  post 'projects/collaberations/:project_id/user/:user_id' , to: 'collaberations#create'
  delete 'projects/collaberations/:id' , to: 'collaberations#delete'

  # Auth

end
