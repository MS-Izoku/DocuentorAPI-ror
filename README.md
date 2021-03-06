# Classes and Usage
## Users and Auth

### Users
Validations:
* Username: pressence , uniqueness
* Password: pressence, confirmation, and a custom REGEX format requirement
* Email: pressence , confirmation , uniqueness, and special validations given the valid_email2 gem

Valid_Email2 Gem Download: 

`gem i valid_email2`

Security:
* Passwords created and authenticated using BCrypt

***

## Forum System:
### Forum
The main forum class, holds the others together

### ForumThread
Individual threads on a parent forum.
** They use a polymorphic asscociation with likables and commentables

### ForumPost
Post inside of an individual thread.  Can be commented on and liked 
** They use a polymorphic asscociation with likables and commentables


### Likes and Dislikes (Likable / Dislikable)
A tally of "likes" on a particular component

Forum-thread
Forum-post


### Comment (Commentable)
Something that can be commented on.  A comment itself is just a string of text (no larger-text), which is attached to something else.


## Project System
### Project
A collection of documents, books, and characters that can be searched through and interconnected.  Meant to be a living, breathing home for all of that nasty paperwork.

### Document
A collection of text-areas combined into a single cohesive piece that represents a complete document.
It belongs to a project.

### TextArea
A simple class that has a title and text fields.  The text will typically have richtext markup.  

Belongs to a document or a character, and has a specific location on the document itself.


### Book
A collection of chapters to form a a larger-form formatted book.
It belongs to a project.

### Chapter
A long-form block of text that can be seperated into pages.
It belongs to a Book.

### Character
A character that takes part in a project.  They are not required for any project usage whatsoever, but are there for the sake of convience and for usage in project richtext.

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

  Create: 'projects/:project_id/collaberations/:project_id/user/
  :user_id'

  Delete: 'projects/:project_id/collaberations/:id'

  ## Users
  Show: 'users/:id' , to: 'users#show'

  Create: 'users/' , to: 'users#create'

  Update: 'users/:id' , to: 'users#update'

  Delete: 'users/:id' , to: 'users#delete'

  ## Authorization / Authentication
  Login (POST):  '/login' , to: 'auth#login'

  Profile (GET): '/profile', to: 'users#profile'