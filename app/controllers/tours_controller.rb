class ToursController < ApplicationController
  def index
    @rooms = [[]]
    @keyword = []
    gon.keyword = []
    gon.latlng = [[]]
    params[:room].each do |i, params|
      break if params[:adress] == ''
      gon.keyword[i.to_i] = params[:adress]
      @keyword.push(params[:adress])
      rooms = Room.near([params[:latitude], params[:longitude]], 50)
      refine_rooms_by_date(i, rooms, params)
    end
    @rooms.each_with_index do |rooms, i|
      rooms.each do |room|
        gon.latlng[i].push(lat: room.latitude, lng: room.longitude)
      end
    end
  end

  def new
    @form = TourForm.new
  end

  private

  def refine_rooms_by_date(i, rooms, params)
    start_day = modify_to_date(params[:start])
    end_day = modify_to_date(params[:end])
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

  def modify_to_date(str)
    Date.parse(str)
  end
end
