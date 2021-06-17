class UsersController < ApplicationController
    before_action :require_current_user!, except: [:create, :new]
    before_action :view_own_profile, except: [:create, :new]
    before_action :current_user_cannot_cannot_sign_up_or_log_in, only: :new
    
    def new
        @user = User.new
    end

    def create
        user = User.new(user_params)

        if user.save
            login!(user)
            redirect_to user_url(user)
        else
            render json: user.errors.full_messages
        end
    end

    def show
        @user = User.find_by(id: params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end

    def view_own_profile
        user = User.find_by(id: params[:id])
        unless current_user == user
            render plain: "You can only view your own profile"
        end
    end
end
