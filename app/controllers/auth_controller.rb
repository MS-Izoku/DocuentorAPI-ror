class AuthController < ApplicationController
    skip_before_action :authorized , only: [:create]
    def login
        user = User.find_by(username: login_params[:username])
        if user && user.authenticate(user_login_params[:password])
            token = encode_token({user_id: user.id})
            render json: {user: user , jwt: token}
        else
            render json: {error: "400" , msg: 'Invalid Username or Password'}
        end 
    end

    def oauth_login
    end

    def logout
    end

    private
    def login_params
        params.require(:user).permit(:username , :password)
    end
end