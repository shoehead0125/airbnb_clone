class ResavationsController < ApplicationController
  def create
    @resavation = Resavation.new(resavation_params)
    if @resavation.save
      redirect_to resavation_path(@resavation)
    else
      render action: :new
    end
  end

  def show
    @resavation = Resavation.find(params[:id])
    @message = Message.new
    @sum_price_of_stay = @resavation.room.price * @resavation.days
  end

  def submit
    @resavation = Resavation.find(params[:id])
    @resavation.status = 1
    if @resavation.save
      redirect_to resavation_path
    else
      render action: :show
    end
  end

  private
    def resavation_params
      params.require(:resavation).permit(:room_id, :start_day, :end_day, :occupancy, :price).merge(user_id: current_user.id)
    end
end
