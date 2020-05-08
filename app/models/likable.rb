class Likable < ApplicationRecord
    belongs_to :like , polymorphic: true
    belongs_to :user
end
