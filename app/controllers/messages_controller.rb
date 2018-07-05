class MessagesController < ApplicationController

  def index
    @message = Message.new
    @bookings = []
    mybookings = current_user.bookings.where.not(status: "pending")
    mysynthbookings = current_user.synths.map {|synth| synth.bookings}
    @bookings << mybookings
    @bookings << mysynthbookings.flatten
    @bookings.flatten!
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
