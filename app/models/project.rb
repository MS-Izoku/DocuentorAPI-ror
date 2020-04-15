class Project < ApplicationRecord
    belongs_to :user
    has_many :books
    has_many :documents
    has_many :characters
end
