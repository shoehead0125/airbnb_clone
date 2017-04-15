class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @resavation = Resavation.find(params[:resavation_id])
    @room = Room.find(params[:room_id])
    geocoder = Geocoder.search("#{ @resavation.room.latitude }, #{ @resavation.room.longitude }")
    @location = geocoder[0].address_components
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      @review.resavation.update(status_review: 1)
      redirect_to resavations_path
    else
      render action: :new
    end
  end

  private
  def review_params
    params.require(:review).permit(:body, :rate).merge(room_id: params[:room_id], user_id: current_user.id, resavation_id: params[:resavation_id])
  end
end
