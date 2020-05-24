class AddIsDislikeToLikes < ActiveRecord::Migration[6.0]
  def change
    add_column :likes, :is_dislike, :boolean
  end
end
