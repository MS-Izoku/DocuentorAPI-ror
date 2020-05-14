class TextArea < ApplicationRecord
    belongs_to :text_areable , polymorphic: true
    has_many :project_updates , as: :updatable
end
