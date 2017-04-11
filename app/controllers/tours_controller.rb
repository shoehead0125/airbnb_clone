class ToursController < ApplicationController
  def index
  end

  def new
    @form = TourForm.new
  end
end
