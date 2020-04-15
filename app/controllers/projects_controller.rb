class ProjectsController < ApplicationController
    def index
        projects = Project.where(user_id: 1)    # change to current user id
        render json: projects
    end

    def show
        project = Project.find_by(id: params[:id])
        render json: project
    end

    def create
        project = Project.new(user_id: 1) # change to current user id
        render json: project
    end

    def update
        project = Project.find_by(id: params[:id])
        project.update(project_params)
        render json: project
    end

    def delete
        project = Project.find_by(id: params[:id])
        if !project
            render json: {error: 404 , msg: "Project could not be found"}
        else
            render json: project
        end
    end

    private
    def project_params
        params.require(:project).permit(:title , :content)
    end

end
