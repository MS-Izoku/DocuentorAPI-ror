class Document < ApplicationRecord
    belongs_to :project
    has_many :text_areas
end
