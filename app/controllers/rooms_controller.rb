class RoomsController < ApplicationController
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

  private

  def room_params
    params.require(:room).permit(:category, :max_number, :adress)
  end
end
