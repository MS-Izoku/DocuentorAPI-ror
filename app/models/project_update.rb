class ProjectUpdate < ApplicationRecord
    before_create :generate_unique_report_number, :generate_update_report_content

    validates :report_number , uniqueness: true

    belongs_to :updatable , :polymorphic => true
    belongs_to :user
    belongs_to :project

    def self.generate_template
        ProjectUpdate.create!(user_id: User.first.id , project_id: Project.first.id , updatable: Project.first)
    end

    private
    def generate_unique_report_number
        # generates a unique ID for updates around the site
        random_int = 0
        begin
            random_int = SecureRandom.random_number(100000000)
        end while ProjectUpdate.where(report_number: random_int).exists?
        self.report_number = random_int
    end

    def generate_update_report_content
        message = "You have a new Update to: #{self.project.title}!"
        self.report_content = message
    end
end
