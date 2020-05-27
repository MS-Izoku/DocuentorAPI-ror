class ProjectUpdate < ApplicationRecord
    validates :report_number , uniqueness: true

    belongs_to :updatable , :polymorphic => true
    belongs_to :user , optional: true # temporary fix, updatables need more work for this to function properly
    belongs_to :project , optional: true # may need to be implemented later
end
