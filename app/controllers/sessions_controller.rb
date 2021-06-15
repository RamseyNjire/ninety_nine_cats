class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )

        if user.nil?
            render json: "Username or password was incorrect"
        else
            render json: "Welcome back, #{user.username}!"
        end
    end
end
