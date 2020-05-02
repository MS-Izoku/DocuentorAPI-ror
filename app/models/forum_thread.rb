class ForumThread < ApplicationRecord
    belongs_to :forum
    has_many :forum_posts
    
end
