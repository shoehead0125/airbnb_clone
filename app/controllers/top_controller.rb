class TopController < ApplicationController
  def index
    @room = Room.new
  end
end
