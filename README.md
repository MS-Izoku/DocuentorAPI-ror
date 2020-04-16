# README



# Endpoints
  ## Projects
  Index: 'projects/index/:user_id'
  Show: 'projects/:id'
  Post: 'projects'
  Update: 'projects/:id'
  Delete: 'projects/:id'

  ## Documents
  Index: 'projects/:project_id/documents/' 
  Show: 'projects/:project_id/documents/:id' 
  Post: 'projects/:project_id/documents/'
  Update: 'projects/:project_id/documents/:id'
  Delete: 'projects/:project_id/documents/:id' 

  ## Books
  Index: 'projects/:project_id/books'
  Show: 'projects/:project_id/book/:id'
  Post: 'projects/:project_id/books/'
  Update: 'projects/:project_id/books/:id'
  Delete: 'projects/:project_id/books/:id'

  ## Collaberations
  Index: 'projects/:project_id/collaberations/collaberations'
  Create: 'projects/:project_id/collaberations/:project_id/user/:user_id'
  Delete: 'projects/:project_id/collaberations/:id'

  ## Users
  Show: 'users/:id' , to: 'users#show'
  Create: 'users/' , to: 'users#create'
  Update: 'users/:id' , to: 'users#update'
  Delete: 'users/:id' , to: 'users#delete'

  ## Authorization / Authentication