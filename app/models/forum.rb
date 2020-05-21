class Forum < ApplicationRecord
    has_many :forum_threads
    has_many :forum_posts , through: :forum_threads

    validates: :title , presence: true , length: {in: 4..125}
end
