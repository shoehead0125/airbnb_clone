class ResavationsController < ApplicationController
  def create
    @resavation = Resavation.new(resavation_params)
    if @resavation.save
      redirect_to resavation_path(@resavation)
    else
      render action: :new
    end
  end

  private
    def resavation_params
      params.require(:resavation).permit(:room_id, :start_day, :end_day, :occupancy, :price).merge(user_id: current_user.id)
    end
end
