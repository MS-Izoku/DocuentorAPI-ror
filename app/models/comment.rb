class Comment < ApplicationRecord
    include Likable
    
    belongs_to :user
    belongs_to :commentable , polymorphic: true
    has_many :comments , as: :commentable
    has_many :likes , as: :likable
end
