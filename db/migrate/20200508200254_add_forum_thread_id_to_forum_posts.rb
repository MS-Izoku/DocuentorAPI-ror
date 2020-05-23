class AddForumThreadIdToForumPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :forum_posts, :forum_thread_id, :integer
  end
end
