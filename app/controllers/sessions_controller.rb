class SessionsController < ApplicationController
    before_action :current_user_cannot_cannot_sign_up_or_log_in, only: :new
    
    def new
    end

    def create
        user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )

        if user.nil?
            render plain: "Username or password was incorrect"
        else
            login!(user)
            redirect_to user_url(user)
        end
    end

    def destroy
        session = logout!
        if params.has_key?(:session)
            user = session.user
            redirect_to user_url(user)
        else
            redirect_to new_session_url
        end
    end

    def logout!
        if params.has_key?(:session)
            @session = Session.find_by(id: params[:session])
        else
            token = session[:session_token]
            @session = Session.find_by(session_token: token)
        end
        @session.destroy
        session[:session_token] = nil
        @session
    end
end
