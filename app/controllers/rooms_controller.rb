class RoomsController < ApplicationController
  before_action :set_room_edit, only: [:edit, :update, :destroy, :show]
  def index
    @rooms = current_user.rooms
  end

  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.new(room_params)
    if @room.save
      current_user.status = 'host'
      current_user.save
      redirect_to rooms_path
    else
      render action: :new
    end
  end

  def edit; end

  def update
    redirect_to edit_room_path(@room.id) unless current_user.id == @room.user_id
    if @room.update(room_params)
      redirect_to rooms_path(current_user.id)
    else
      render action: :edit
    end
  end

  def destroy
    if @room.destroy
      redirect_to rooms_path
    else
      render action: :index
    end
  end

  def search
    @rooms = []
    gon.latlng = []
    gon.keyword = params[:form][:address]
    rooms = Room.near([params[:form][:latitude], params[:form][:longitude]], 50)
    refine_rooms_by_date(rooms)
    @rooms.each do |room|
      gon.latlng.push(lat: room.latitude, lng: room.longitude)
    end
  end

  def show
    @resavation = Resavation.new
    check_out = modify_to_date(params[:check_out])
    check_in = modify_to_date(params[:check_in])
    @stay_days = (check_out - check_in).to_i
    @sum_price = @room.price * @stay_days
    @sum = @sum_price + @room.cleaning + @room.service
  end

  private

  def set_room_edit
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:category, :max_number, :address, :name, :image, :latitude, :longitude)
  end

  def refine_rooms_by_date(rooms)
    start_day = modify_to_date(params[:form][:start_day])
    end_day = modify_to_date(params[:form][:end_day])
    rooms.each do |room|
      flag = 0
      room.resavations.each do |resavation|
        if start_day.between?(resavation.start_day, resavation.end_day) || end_day.between?(resavation.start_day, resavation.end_day)
          flag = 1
        end
      end
      @rooms << room if flag.zero?
    end
  end
end
