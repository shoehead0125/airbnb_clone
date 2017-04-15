class TopController < ApplicationController
  def index
    @form = Form.new
  end
end
