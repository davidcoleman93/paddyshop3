class SessionsController < ApplicationController
  def index
	
  end

  def new
	
  end
  
  def create
	user = User.find_by email: params[:email]
	if user && user.authenticate(params[:password])
		# sign in
		session[:user_id] = user.id
		flash[:notice] = "You are signed in!"
		redirect_to user
	else
		flash.now[:notice] = "Invalid email/password."
		render 'new'
	end
  
  end

  def destroy
	session[:user_id] = nil
	flash[:notice] = "You are now signed out"
	redirect_to login_path
  end 
end
