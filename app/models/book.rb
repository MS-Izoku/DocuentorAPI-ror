class Book < ApplicationRecord
    belongs_to :project
    has_many :chapters
end
