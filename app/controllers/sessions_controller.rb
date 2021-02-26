class SessionsController < ApplicationController
    def welcome
              if logged_in?
            redirect_to user_path(current_user)
        end
    end

    def new
        @user = User.new
    end

    def create
    user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:alert] = "Invalid credrntials. Please try again."
            redirect_to "/login"
        end
     end

    def omniauth
        user = User.create_from_omniauth(auth)    
           
        if user.save
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:alert] = user.errors.full_messages.join(", ")
            redirect_to concerts_path
        end
    end

    def destroy
    session.delete(:user_id)
    redirect_to root_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end

end
