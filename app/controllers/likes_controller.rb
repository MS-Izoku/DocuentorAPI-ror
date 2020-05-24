class LikesController < ApplicationController
    def create
        like = Like.new(like_params)
        find_existing_like = Like.find_by(user_id: like_params[:user_id] , likable_type: like_params[:likable_type] , likable_id: like_params[:likable_id])
        if find_existing_like
            render json: like
        end

        like.save
        render json: like
    end

    def update
        like = Like.find_by(like_params)
        like.update(is_dislike: !like.is_dislike)
        render json: like
    end

    def delete
        like = Like.find_by(like_params)
        check_if_exists(like)
        like.delete
        render json: like
    end

    private
    def like_params
        params.require(:like).permit(:user_id , :likable_id , :likable_type , :is_dislike)
    end
end
