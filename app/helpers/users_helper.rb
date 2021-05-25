module UsersHelper
<<<<<<< HEAD
=======
    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end
>>>>>>> b72f5c006d94026be6ed4a2df801950a6684c337
end
