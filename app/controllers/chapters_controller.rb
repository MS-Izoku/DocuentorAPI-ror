class ChaptersController < ApplicationController
    def index
        chapters = Chapter.where(book_id: params[:book_id])
        render json: chapters
    end

    def show
        chapter = Chapter.find_by(id: params[:id])
        check_if_exists(chapter)
        render json: chapter
    end

    def create
        chapter Chapter.new(chapter_creation_params)
        if chapter.errors.any?
            puts "Error"
        else
            chapter.save
            render json: chapter
        end
    end

    def update
        chapter = Chapter.find_by(id: params[:id])
        check_if_exists(chapter)
        chapter.update(chapter_params)
        render json: chapter
    end

    def delete
        chapter = Chapter.find_by(id: params[:id])
        check_if_exists(chapter)
        chapter.delete
        render json: chapter
    end

    private
    def chapter_params
        params.require(:chapter).permit(:title , :content)
    end

    def chapter_creation_params
        params.require(:chapter).permit(:title , :content , :book_id)
    end
end
