class ForumsController < ApplicationController
    def index
        forums = Forum.all
        render json: forums
    end

    def show
        forum = Forum.find_by(id: params[:id])
        check_if_exists(forum)
        render json: forum
    end

    def create
        forum = Forum.create(title: params[:title])
        render json: forum
    end

    def delete
        forum = Forum.find_by(id: params[:id])
        check_if_exists(forum)
        forum.delete
        render json: forum
    end
end
