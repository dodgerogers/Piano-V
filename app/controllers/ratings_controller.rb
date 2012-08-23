class RatingsController < ApplicationController
  
  def create
    @rating = current_user.ratings.build(params[:rating])
      if @rating.save
        flash[:notice] = "rating created"
        redirect_to :back
      else
        flash[:notice] = "something went wrong"
        redirect_to :back
      end
    end
end