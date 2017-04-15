class Form
  include ActiveModel::Model
  
  attr_accessor :latitude, :longitude, :address, :start_day, :end_day, :occupancy
end
