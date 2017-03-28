class RoomsController < ApplicationController
  before_action :set_room_edit, only: [:edit, :update, :destroy]
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
    gon.keyword = params[:room][:adress]
    @rooms = Room.near([params[:room][:latitude], params[:room][:longitude]], 50)
    gon.latlng = []
    @rooms.each do |room|
      gon.latlng.push(lat: room.latitude, lng: room.longitude)
    end
  end

  private

  def set_room_edit
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:category, :max_number, :adress, :name, :image, :latitude, :longitude)
  end
end
