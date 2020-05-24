class ChapterSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :content, :book_id, :chapter_index
end
