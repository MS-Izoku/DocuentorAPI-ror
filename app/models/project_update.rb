class ProjectUpdate < ApplicationRecord
    before_create :generate_unique_report_number

    validates :report_number , uniqueness: true

    belongs_to :updatable , :polymorphic => true
    belongs_to :user
    belongs_to :project
    
    def self.generate_template
        ProjectUpdate.create!(user_id: User.first.id , project_id: Project.first.id , updatable: Project.first)
    end

    def self.create(params = {} , message)
        new_update = ProjectUpdate.new(user_id: params[:user_id] , updatable_type: params[:updatable_type] , updatable_id: params[:updatable_id])
        new_update.generate_update_report_content(message)
        if new_update.valid?
            new_update.save
        else
            return { error: { message: "Project Update Params are invalid" , log: new_update.errors } }
        end
    end

    def test_create
        temp_params = {user_id: User.first.id , updatable: Project.first}
        ProjectUpdate.create(my_params , "Creating New: #{updatable.class}")
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

    def generate_update_report_content(message = "You have a new Update to: #{self.project.title}!")
        self.report_content = message
    end
end
