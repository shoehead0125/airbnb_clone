class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    return unless @message.save
    respond_to do |format|
      format.html { redirect_to resavation_path(params[:resavation_id]) }
      format.json { render 'message.json.jbuilder' }
    end
  end

  private

  def message_params
    params.require(:message).permit(:body).merge(user_id: current_user.id, resavation_id: params[:resavation_id])
  end
end
