module Updatable
    def generate_update_report_content(message = "You have a new Update to: #{self.project.title}!")
        self.report_content = message
    end

    def generate_unique_report_number
        # generates a unique ID for updates around the site
        random_int = 0
        begin
            random_int = SecureRandom.random_number(100000000)
        end while ProjectUpdate.where(report_number: random_int).exists?
        self.report_number = random_int
    end

    def auto_generate_report
        new_report = ProjectUpdate.new(updatable: self)
        generate_unique_report_number
        if new_report.valid
            new_report.save
        else
            {error: {message: "Error Creating Update" , log: new_report.errors.all}}
        end
    end

    included do
        before_save :auto_generate_report
    end
end