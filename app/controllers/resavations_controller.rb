class ResavationsController < ApplicationController
  def index
    @resavations = Resavation.where(user_id: current_user.id)
  end

  def create
    @resavation = Resavation.new(resavation_params)
    if @resavation.save
      redirect_to resavation_path(@resavation)
    else
      render action: :new
    end
  end

  def bulk_create
    @resavations = []
    params[:resavation].each_with_index do |params, i|
      room = Room.find(params[1][:room_id])
      check_in = modify_to_date(params[1][:start_day])
      check_out = modify_to_date(params[1][:end_day])
      stay_days = (check_out - check_in).to_i
      sum_price = room.price * stay_days
      sum = sum_price + room.cleaning + room.service
      @resavation = Resavation.new(resavation_bulk_params(i, sum))
      @resavation.save
    end
    redirect_to resavations_path
  end

  def show
    @resavation = Resavation.find(params[:id])
    @message = Message.new
    @sum_price_of_stay = @resavation.room.price * @resavation.days
    geocoder = Geocoder.search("#{ @resavation.room.latitude }, #{ @resavation.room.longitude }")
    @location = geocoder[0].address_components
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

    def resavation_bulk_params(i, sum)
      params.require(:resavation).require(i.to_s).permit(:room_id, :start_day, :end_day, :occupancy).merge(user_id: current_user.id, price: sum)
    end

    def modify_to_date(str)
      Date.parse(str)
    end
end
