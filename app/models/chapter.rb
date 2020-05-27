class Chapter < ApplicationRecord
    include Updatable

    belongs_to :book
    has_many :project_updates , as: :updatable

    def generate_chapter_template(book_id , chapter_number)
        Chapter.create(book_id: book_id , title: "Chapter #{chapter_number}" , content: "<p>Start Writing Here!</p>")
    end
end
