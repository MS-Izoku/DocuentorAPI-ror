class Forum < ApplicationRecord
    has_many :forum_threads
    has_many :forum_posts , through: :forum_threads
end
