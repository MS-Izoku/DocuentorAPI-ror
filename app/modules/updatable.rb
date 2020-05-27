module Updatable
    def generate_update(updatable_object , user_id , project_id)
        ProjectUpdate.create(updatable: updatable_object , user_id: user_id , project_id: project_id)
    end
end