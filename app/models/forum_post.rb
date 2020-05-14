class ForumPost < ApplicationRecord
    belongs_to :forum_thread
    belongs_to :user
    has_many :comments , as: :commentable
    has_many :likes , as: :likable
    has_many :dislikes , as: :dislikable
end
