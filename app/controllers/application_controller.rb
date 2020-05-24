class ApplicationController < ActionController::API
    #before_action :authorized

    def check_if_exists(model)
        render json: {error: 400 , msg: "Model #{model.class} not found"} if !model
        # return model if found?
    end
    
    def auth_header
        request.headers['Authorization']
    end

    def encode_token(payload)
        JWT.encode(payload , ApplicationController.secret)
    end

    def decoded_token
        if auth_header
            token = auth_header.split(' ')[1]
            begin
            JWT.decode(token , ApplicationController.secret , true , algorithm: 'HS256')
            rescue JWT.DecodeError
                nil
            end
        end
    end

    def current_user
        if decoded_token
            user_id = decoded_token[0]['user_id']
            user = User.find_by(id: user_id)
        end
    end

    def logged_in?
        !!current_user
    end

    def authorized
        render json: {msg: 'Please Log In'} , status: :unauthorized unless logged_in?
    end
            
    private
    def self.secret
        "f0r_a11_7h3_m0n37_7h27_3R_7_h@d"
    end
end
