class DislikesController < ApplicationController
    def create
        dislike = Dislike.new(dislike_params)
        find_existing_dislike = Dislike.find_by(dislike_params)
        find_existing_like = Like.find_by(likable_type: params[:dislikable_type] , likable_id: params[:dislikable_id] , user_id: params[:user_id])

        if find_existing_dislike.nil? && find_existing_like.nil?
                dislike.save
                render json: dislike
        elsif find_existing_like
            like = Like.find_by(likable_id: params[:likable_id] , likable_type: [:likable_type])
            like.delete
            dislike.save
            render json: dislike
        else
            render json: find_existing_dislike
        end
    end

    def delete
        dislike = Dislike.find_by(dislike_params)
        check_if_exists(dislike)
        dislike.delete
        render json: dislike
    end

    private
    def dislike_params
        params.require(:dislike).permit(:user_id , :dislikable_id , :dislikable_type)
    end
end
