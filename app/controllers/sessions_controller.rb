class SessionsController < ApplicationController
    def new
    end
    
    def create
        @user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )

        if @user.nil?
            flash.now[:errors] = "The username or password was incorrect"
            render :new
        else
            login!(@user)
            redirect_to cats_url
        end
    end
end
