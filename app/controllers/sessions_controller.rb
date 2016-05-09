class SessionsController < ApplicationController

  def create
  	@user = User.where(email: params[:email]).first
      if @user && @user.password ==  params[:password]
        session[:user_id] = @user.id
        flash[:notice] = "You have been signed in"
        redirect_to posts_path
      else 
        flash[:alert] = "This email and password combination does not match"
        redirect_to root_path
      end
  end
	
	def destroy
		session.clear
		redirect_to root_path
		flash[:notice] = "You have been signed out"
	end

end
