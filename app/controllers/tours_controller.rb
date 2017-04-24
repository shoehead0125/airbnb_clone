class ToursController < ApplicationController
  def index
    @tours = current_user.tours
  end

  def new; end

  def search
    @tour = Tour.new(tour_params)
      if @tour.save
        @rooms = Array.new(5).map { [] }
        @keyword = []
        @starts = []
        @ends = []
        @occupancys = []
        gon.keyword = []
        gon.latlng = Array.new(5).map { [] }
        params[:form].each do |i, params|
          break if params[:address] == ''
          gon.keyword[i.to_i] = params[:address]
          @starts.push(params[:start_day])
          @ends.push(params[:end_day])
          @occupancys.push(params[:occupancy])
          @keyword.push(params[:address])
          rooms = Room.near([params[:latitude], params[:longitude]], 2)
          refine_rooms_by_date(i, rooms, params)
        end
        @rooms.each_with_index do |rooms, i|
          rooms.each do |room|
            gon.latlng[i].push(lat: room.latitude, lng: room.longitude)
          end
        end
      else
        render action: :new
      end
    end

  private

  def refine_rooms_by_date(i, rooms, params)
    start_day = modify_to_date(params[:start_day])
    end_day = modify_to_date(params[:end_day])
    rooms.each do |room|
      flag = 0
      room.resavations.each do |resavation|
        if start_day.between?(resavation.start_day, resavation.end_day) || end_day.between?(resavation.start_day, resavation.end_day)
          flag = 1
        end
      end
      @rooms[i.to_i] << room if flag.zero?
    end
  end

  def tour_params
    params.require(:tour).permit(:name).merge(user_id: current_user.id)
  end
end
