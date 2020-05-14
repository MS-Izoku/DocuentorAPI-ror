class Document < ApplicationRecord
    belongs_to :project
    has_many :text_areas , as: :textareable
    has_many :project_updates , as: :updatable

    def generate_wiki_template(title , project_id)
        
    end
end
