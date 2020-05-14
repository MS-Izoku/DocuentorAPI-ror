class ProjectUpdate < ApplicationRecord
    before_create :generate_unique_report_number, :generate_update_report

    belongs_to :updatable , :polymorphic => true
    belongs_to :user
    belongs_to :project

    private
    def generate_unique_report_number
        # generates a unique ID for updates around the site
        random_int = 0
        begin
            random_int = SecureRandom.random_number(100000000)
        end while ProjectUpdate.where(report_number: random_int).exists?
    end

    def generate_update_report
        puts "Creating A Report!"
    end
end
