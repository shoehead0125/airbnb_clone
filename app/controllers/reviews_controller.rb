class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @resavation = Resavation.find(params[:resavation_id])
    @room = Room.find(params[:room_id])
  end

  def create
    @review = Review.new(review_params)
    @review.status_review = 1
    if @review.save
      redirect_to resavations_path
    else
      render action: :new
    end
  end

  private
  def review_params
    params.require(:review).permit(:body, :rate).merge(room_id: params[:room_id], user_id: current_user.id)
  end
end
