class DocumentsController < ApplicationController
    def index
        documents = Document.where(project_id: params[:id])
        render json: documents
    end

    def show
        document = Document.find_by(id: parmas[:id])
        render json: document
    end

    def create
        document = Document.new(document_params)
        document.project_id = params[:project_id]
        if document.save
            render json: document
        else
            render json: document.errors.all
        end
    end

    def update
        document = Document.find_by(id: params[:id])
        check_if_exists(document)
        document.update(document_params)
        render json: document
    end

    def delete
        document = Document.find_by(id: params[:id])
        check_if_exists(document)
        document.delete
        render json: document
    end

    private
    def document_params
        params.require(:document).permit(:title , :content)
    end
end
