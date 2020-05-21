class ForumThread < ApplicationRecord
    belongs_to :forum
    has_many :forum_posts
    
    has_many :likes , as: :likable
    has_many :dislikes , as: :dislikable

    validates :title , presence: true
end
