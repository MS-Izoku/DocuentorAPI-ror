Rails.application.routes.draw do
  resources :project_updates
  resources :text_areas
  resources :characters
  resources :forum_posts
  resources :forums
  resources :comments
  resources :likes , only: [:create , :update , :delete]
  # resources :collaberations
  # resources :users
  # resources :documents
  # resources :chapters
  # resources :books
  # resources :projects

  # setup nested routes

  # Projects
  get '/projects/index/:user_id' , to: "projects#index"
  get '/projects/:id' , to: 'projects#show'
  post '/projects', to: 'projects#create'
  patch '/projects/:id' , to: 'projects#create'
  delete '/projects/:id' , to: 'projects#delete'

  ###
  # Documents
  get '/projects/:project_id/documents/', to: 'documents#index' 
  get '/projects/:project_id/documents/:id' , to: 'documents#show' 
  post '/projects/:project_id/documents/' , to: 'documents#create' 
  patch '/projects/:project_id/documents/:id' , to: 'documents#update' 
  delete '/projects/:project_id/documents/:id' , to: 'documents#delete' 

  ###
  # Books
  get '/projects/:project_id/books' , to: 'books#index'
  get '/projects/:project_id/book/:id' , to: 'books#show'
  post '/projects/:project_id/books/' , to: 'books#create'
  patch '/projects/:project_id/books/:id' , to: 'books#update'
  delete '/projects/:project_id/books/:id' , to: 'books#delete'

  # Collaberations
  get '/projects/:project_id/collaberations/collaberations' , to: 'collaberations#index'
  post '/projects/:project_id/collaberations/:project_id/user/:user_id' , to: 'collaberations#create'
  delete '/projects/:project_id/collaberations/:id' , to: 'collaberations#delete'


  # Users
  get '/users/:id' , to: 'users#show'
  post '/users/' , to: 'users#create'
  patch '/users/:id' , to: 'users#update'
  delete '/users/:id' , to: 'users#delete'

  # Auth
  post '/login/' , to: 'auth#login'
  get '/profile/', to: 'users#profile'

end
