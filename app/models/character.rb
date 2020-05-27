class Character < ApplicationRecord
    include Updatable
    
    belongs_to :project
    has_many :text_areas , as: :text_areable
    has_many :project_updates , as: :updatable
    has_many :sa

    def generate_character_template
        char = Character.create(name = "New Character" , height = 150 , weight = 90)

        TextArea.create(title: "Appearance" , content: "<p></p>" , text_areable: char)
        TextArea.create(title: "Personality" , content: "<p></p>" , text_areable: char)
        TextArea.create(title: "Biography" , content: "<p></p>" , text_areable: char)
        TextArea.create(title: "Trivia" , content: "<p></p>" , text_areable: char)
        TextArea.create(title: "Notes" , content: "<ul><li></li></ul>" , text_areable: char)
    end
end
