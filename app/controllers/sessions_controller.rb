# class SessionsController < ApplicationController
#     def new
#     end

#     def create
#     user = User.find_by(username: params[:user][:username])
#         if user && user.authenticate(params[:user][:password])
#         session[:user_id] = user.id
#         redirect_to concerts_path
#         else
#         render :new
#         end
#     end

#     # def omniauth
#     # user = User.from_omniauth(auth)
#     #     if user.valid?
#     #     session[:user_id] = user.id
#     #     redirect_to venues_path
#     #     else
#     #     redirect_to login_path
#     #     end
#     # end

#     def destroy
#     session.delete :username
#     redirect_to 'concerts_path'
#     end

#     protected

#     # def auth
#     # request.env[‘omniauth.auth’]
#     # end

# end
