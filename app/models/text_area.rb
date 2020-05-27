class TextArea < ApplicationRecord
    include Updatable
    belongs_to :text_areable , polymorphic: true
    has_many :project_updates , as: :updatable
end
