class Document < ApplicationRecord
    belongs_to :project
    has_many :text_areas

    def generate_wiki_template(title , project_id)
        
    end
end
