class CollaberationsController < ApplicationController
    def index
        collaberations = Collaberation.where(project_id: params[:project_id])
        render json: collaberations
    end

    def create
        collaberation = Collaberation.new(collaberation_params)
        if !collaberation.save
            render json: {error: "400" , msg: "Error creating new collaberation"}
        end
        render json: collaberation
    end

    def delete
        collaberation = Collaberation.find_by(id: params[:id])
        if !collaberation
            render json: {error: "404" , msg: "Error deleting collaberation"}
        else
            render json: collaberation
        end
    end

    private
    def collaberation_params
        params.require(:collaberation).permit(:user_id , :project_id)
    end
end
