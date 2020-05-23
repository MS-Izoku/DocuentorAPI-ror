class CreateForumPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :forum_posts do |t|
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
