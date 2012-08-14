class RatingsController < ApplicationController
  
  def create
    @rating = current_user.ratings.build(params[:rating])
      if @rating.save
        flash[:success] = "rating created"
        redirect_to :back
      else
        flash[:error] = "something went wrong"
        redirect_to :back
      end
    end
end