class ApplicationController < ActionController::API
    def check_if_exists(model)
        render json: {error: 400 , msg: "Model #{model.class} not found"} if !model
    end
end
