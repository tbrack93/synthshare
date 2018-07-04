class MessagesController < ApplicationController

  def index
    @message = Message.new
    @bookings = current_user.bookings.where.not(status: "pending")
    @synths = current_user.synths
  end

  def create
    @message = Message.new(message_params)
    @message.save
    respond_to do |format|
      format.html { redirect_to messages_path }
      format.js
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :user_id, :booking_id)
  end

end
