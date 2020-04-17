class UsersController < ApplicationController
    skip_before_action :authorized , only: [:create]

    def profile
        # current user is from ApplicationController
        render json: {user: current_user}
    end

    def create
        user = User.create(user_params)
        if !user.valid?
            render json: {error: "400" , msg: "Error creating user"}
        else
            # create initial JWT when creation succeeds
            render json: {user: user , jwt: encode_token(user_id: user.id)}
        end
    end

    def show
        user = User.find_by(id: params[:id])
        check_if_exists(user)
        render json: user
    end

    def update
        user = User.find_by(id: params[:id])
        check_if_exists(user)
        user.update(user_params)
        render json: user
    end

    def delete
        user = User.find_by(id: params[:id])
        check_if_exists(user)
        user.delete
        render json: user
    end

    private
    def user_params
        params.require(:user).permit(:username , :password , :email)
    end
end
