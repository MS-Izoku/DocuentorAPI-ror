class Book < ApplicationRecord
    include Updatable
    
    belongs_to :project
    has_many :chapters
    has_many :project_updates , as: :updatable
    has_many :text_areas , as: :text_areable

    def self.generate_book_with_chapters(project_id, title, chapter_count)
        book = Book.create(project_id: project_id , title: title)
        chapter_count.times do |chapter_index|
            chapter = Chapter.new(title: "Chapter #{chapter_index}", book_id: book.book_id)
        end
    end

end
