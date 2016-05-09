class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
       flash[:notice] = "You account is created"
       redirect_to users_path
      else
        flash[:alert] = "error"
        redirect_to new_user_path
    end

  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @post = Post.new
    @comments = Comment.all
    @comment = Comment.new
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:notice] = "User has been updated"
    redirect_to user_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
      redirect_to users_path
    end

  private

  def user_params
    params.require(:user).permit(:fname, :lname, :email, :username, :password)
  end
end

