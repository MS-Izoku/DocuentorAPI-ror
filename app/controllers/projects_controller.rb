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
        check_if_exists(project)
        project.update(project_params)
        render json: project
    end

    def delete
        project = Project.find_by(id: params[:id])
        check_if_exists(project)
        project.delete
        render json: project
    end

    private
    def project_params
        params.require(:project).permit(:title , :content)
    end

end
