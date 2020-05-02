class AuthController < ApplicationController
    skip_before_action :authorized , only: [:login]
    def login
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
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
end