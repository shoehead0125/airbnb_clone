class ToursController < ApplicationController
  def index
    @rooms = Array.new(5).map{Array.new}
    @keyword = []
    @starts = []
    @ends = []
    @occupancys = []
    gon.keyword = []
    gon.latlng = Array.new(5).map{Array.new}
    params[:form].each do |i, params|
      break if params[:address] == ''
      gon.keyword[i.to_i] = params[:address]
      @starts.push(params[:start_day])
      @ends.push(params[:end_day])
      @occupancys.push(params[:occupancy])
      @keyword.push(params[:address])
      rooms = Room.near([params[:latitude], params[:longitude]], 50)
      refine_rooms_by_date(i, rooms, params)
    end
    @rooms.each_with_index do |rooms, i|
      rooms.each do |room|
        gon.latlng[i].push(lat: room.latitude, lng: room.longitude)
      end
    end
  end

  def new; end

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
end
