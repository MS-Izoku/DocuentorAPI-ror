class Document < ApplicationRecord
    include Updatable
    
    belongs_to :project
    has_many :text_areas , as: :textareable
    has_many :project_updates , as: :updatable

    def generate_wiki_template(title = "" , project_id)
        document = Document.create!(title: title , project_id: project_id)
        5.times do |text_area|
            TextArea.create!(title: "Wiki Section" , content: "<p>A Text Area to organize your page</p>", text_areable: document)
        end
    end
end
