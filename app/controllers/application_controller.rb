class ApplicationController < ActionController::Base
#     # Prevent CSRF attacks by raising an exception.
#     protect_from_forgery with: :exception

#     helper_method :current_user

#     private

#     def current_user
#     @user ||= User.find_by_id(session[:user_id])
#     end

    def logged_in?
        !!session[:user_id]
    end

    def redirect_if_not_logged_in
        redirect_to '/' if !logged_in?
    end

end
