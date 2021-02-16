class SessionsController < ApplicationController
    def welcome
        if logged_in?
            redirect_to user_path(current_user)
        end
    end

    def create
    user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:message] = "Incorrect login info, please try again"
            redirect_to "/login"
        end
     end

    def omniauth
        user = User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.username = auth['info']['first_name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(12)
        if user.save
            session[:user_id] = user.id
            redirect_to new_concert_path
        else
            flash[:message] = user.errors.full_messages.join(", ")
            #@concerts = Concert.all
            #redirect_to concerts_path
            #render 'concerts/index'
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
