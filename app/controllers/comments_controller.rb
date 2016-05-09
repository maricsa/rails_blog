class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @post = @comment.post
    @comment.save
      redirect_to post_path(@post) 
  end

   def destroy
    Comment.find(comment_params).destroy
   redirect_to post_path(@post)
   	
  end

  def update 
    @comment = Comment.find(comment_params)
    @post=@comment.post
    @comment.update(comment_params)
    if @comment.save
      flash[:notice] = "Comment updated"
    else 
      flash[:alert] = "Error in updating"
    end 
    redirect_to post_path(@post)
  end 


  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id)
  end


end
