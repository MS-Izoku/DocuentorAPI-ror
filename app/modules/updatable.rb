module Updatable
    extend ActiveSupport::Concern

    def generate_unique_report_number
        # generates a unique ID for updates around the site
        random_int = 0
        begin
            random_int = SecureRandom.random_number(100000000)
        end while ProjectUpdate.where(report_number: random_int).exists?
        random_int
    end

    def generate_message(message = "Default Message to Show")
    end

    def auto_generate_report
        new_report = ProjectUpdate.new(updatable: self)
        new_report.report_number = generate_unique_report_number
        new_report.report_content = "New Update Created"
        if new_report.valid?
            new_report.save
        else
            {error: {message: "Error Creating Update" , log: new_report.errors}}
        end
    end

    included do
        after_save :auto_generate_report
    end
end
