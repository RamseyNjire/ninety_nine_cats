class ApplicationController < ActionController::Base
    helper_method :current_user

    def login!(user)
        @current_user = user
        @session = @current_user.sessions.build
        @session.save! if @session.valid?
        session[:session_token] = @session.session_token
    end

    # def logout!
    #     token = session[:session_token]
    #     @session = Session.find_by(session_token: token)
    #     @session.destroy
    #     session[:session_token] = nil
    # end

    def current_user
        return nil if session[:session_token].nil?
        token = session[:session_token]
        session = Session.find_by(session_token: token)
        @current_user ||= session.user
    end

    def require_current_user!
        redirect_to new_session_url if current_user.nil?
    end

    def current_user_cannot_cannot_sign_up_or_log_in
        redirect_to cats_url if current_user
    end
end
