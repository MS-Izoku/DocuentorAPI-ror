class Project < ApplicationRecord
    belongs_to :user
    has_many :books
    has_many :documents
    has_many :characters
    has_many :collaberations # User to User
    has_many :project_updates , as: :updatable
end
