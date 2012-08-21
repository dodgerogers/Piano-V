class CommentsController < ApplicationController
  
  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.includes(:user)
  end
  
  def create
    @comment = current_user.comments.build(params[:comment])
    if @comment.save
      flash[:success] = "comment created!"
      redirect_to :back
    else
      flash[:error] = "comment content can't be blank, please try again"
      redirect_to :back
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "comment deleted"
    redirect_to :back
  end
end