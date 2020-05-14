class ProjectUpdate < ApplicationRecord
    belongs_to :updatable , :polymorphic => true
    belongs_to :user
    belongs_to :project
end
