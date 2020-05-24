class ForumPost < ApplicationRecord
    validates :content , presence: true

    belongs_to :forum_thread
    belongs_to :user
    has_many :comments , as: :commentable
    has_many :likes , as: :likable
end
