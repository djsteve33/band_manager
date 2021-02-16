class SessionsController < ApplicationController
    def welcome
        if logged_in?
            redirect_to users_path(current_user)
        end
    end

    def create
    user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to users_path(user)
        else
            flash[:message] = "Incorrect login info, please try again"
            redirect_to "/login"
        end
     end

    def omniauth
        user = User.create_from_omniauth(auth)       
        if user.save
            session[:user_id] = user.id
            redirect_to new_concert_path
        else
            flash[:message] = user.errors.full_messages.join(", ")
            redirect_to concerts_path
        end
    end

    def destroy
    session.clear
    redirect_to root_path
    end

    private

    def auth
        request.env[‘omniauth.auth’]
    end

end
