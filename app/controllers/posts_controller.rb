class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
    	flash[:notice] = "post created"
       redirect_to posts_path
      else
        flash[:alert] = "error"
      end
  end

  def show
    if current_user == nil
      redirect_to root_path
    else
      @post = Post.find(params[:id])
      @user = @post.user
      @comment = @post.comments
    end
  end

  def update
    @post = Post.find(params[:id])
    @post = Post.update(post_params)
    flash[:notice] = "Post updated"  
    redirect_to post_path
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def destroy
    @comments = Post.find(params[:id]).comments
    Post.find(params[:id]).destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:body, :user_id)
  end


end








