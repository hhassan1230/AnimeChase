class SessionsController < ApplicationController

	def create 
		 @user = User.from_omniauth(env["omniauth.auth"])
		 session[:user_id] = @user.id
		 @current_user ||= User.find(session[:user_id]) if session[:user_id]
		#binding.pry
		 redirect_to '/' #, :notice => "You're Signed in, #{@user.first_name}!"
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, :notice => "You're Signed out."
	end

end
