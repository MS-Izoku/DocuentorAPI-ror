class CreateForumThreads < ActiveRecord::Migration[6.0]
  def change
    create_table :forum_threads do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :forum_id

      t.timestamps
    end
  end
end
