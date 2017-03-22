class RoomsController < ApplicationController
  before_action :set_room_edit, only: [:edit, :update]
  def index
    @rooms = current_user.rooms
  end

  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.new(room_params)
    if @room.save
      redirect_to root_path
      current_user.status = 'host'
      current_user.save
      # TODO
      # 作り込みの際には部屋のedit_pathへ飛ぶ
    else
      render action: :new
    end
  end

  def edit; end

  def update
    if @room.update(room_params)
      redirect_to rooms_path(current_user.id)
    else
      render action: :edit
    end
  end

  private

  def set_room_edit
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:category, :max_number, :adress, :name, :image)
  end
end
