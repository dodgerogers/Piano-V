class CommentsController < ApplicationController
  
  def create
    @comment = current_user.comments.build(params[:comment])
    if @comment.save
      flash[:success] = "comment created!"
      redirect_to post_path
    else
      flash[:error] = "please try again"
      redirect_to root_path
    end
  end
end