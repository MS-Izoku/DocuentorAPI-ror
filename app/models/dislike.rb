class Dislike < ApplicationRecord
    belongs_to :user
    belongs_to :dislikable , polymorphic: true
end
