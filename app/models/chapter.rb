class Chapter < ApplicationRecord
    belongs_to :book
    has_many :project_updates , as: :updatable
end
