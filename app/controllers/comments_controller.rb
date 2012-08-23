class CommentsController < ApplicationController
 
  
  def create
    @comment = current_user.comments.build(params[:comment])
    if @comment.save
      flash[:notice] = "comment created!"
      redirect_to :back
    else
      flash[:notice] = "comment content can't be blank, please try again"
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