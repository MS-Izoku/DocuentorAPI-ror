class Project < ApplicationRecord
    include Updatable

    belongs_to :user
    has_many :books
    has_many :documents
    has_many :characters
    has_many :collaberations # User to User
    has_many :project_updates , as: :updatable

    def self.create_test
        Project.create(user_id: 1 , title: "Test Title" , summary: "Test Summary")
    end
end
