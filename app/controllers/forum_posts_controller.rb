class ForumPostsController < ApplicationController
    def index
        posts = ForumPost.where(forum_thread_id: params[:forum_thread_id])
    end

    def create
        post = Post.new(post_params)
        if post.valid?
            render json: post
        else
            render json: {message: "Problem Posting" , errors: post.errors.all}
        end
    end

    def update
        post = Post.find_by(id: params[:id])
        check_if_exists(post)
        post.update(post_params)
        render json: post
    end

    def delete
        post = ForumPost.find_by(id: params[:id])
        check_if_exists(post)
        post.delete
        render json: post
    end

    private
    def post_params
        params.require(:post).permit(:content)
    end
end
