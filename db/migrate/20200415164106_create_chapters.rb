class CreateChapters < ActiveRecord::Migration[6.0]
  def change
    create_table :chapters do |t|
      t.string :title
      t.text :content
      t.integer :book_id
      t.integer :chapter_index

      t.timestamps
    end
  end
end
