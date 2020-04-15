class BooksController < ApplicationController
    def index
    end

    def show
    end

    def create
    end

    def update
    end

    def delete
    end

    private
    def book_params
        params.require(:book).permit(:title , :summary)
    end
end
