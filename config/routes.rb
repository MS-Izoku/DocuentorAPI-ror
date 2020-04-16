Rails.application.routes.draw do
  # resources :collaberations
  # resources :users
  # resources :documents
  # resources :chapters
  # resources :books
  # resources :projects

  get 'projects/index/:user_id' , to: "projects#index"
  get 'projects/:id' , to: 'projects#show'
  post 'projects' to: 'projects#create'
  patch 'projects/:id' , to: 'projects#create'
  delete 'projects/:id' , to: 'projects#delete'

  get 'projects/:project_id/documents', to: 'documents#index'
  get 'documents/:id' , to: 'documents#show'
  post 'documents/' , to: 'documents#create'
  patch 'documents/:id' , to: 'documents#update'
  delete 'documents/:id' , to: 'documents#delete'

  
end
