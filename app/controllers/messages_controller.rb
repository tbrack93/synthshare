class MessagesController < ApplicationController

  def index
    @message = Message.new
    authorize @message
    @bookings = []
    mybookings = current_user.bookings.where.not(status: "pending")
    mysynthbookings = current_user.synths.map {|synth| synth.bookings}
    @bookings << mybookings
    @bookings << mysynthbookings.flatten
    @bookings.flatten!
    @bookings.sort_by! { |booking| booking.lastmessage}
    @bookings.reverse!.each { |booking| authorize booking, :index? }
  end

  def create
    @message = Message.new(message_params)
    authorize @message
    @message.save
    respond_to do |format|
      format.html { redirect_to messages_path }
      format.js
    end
    booking = @message.booking
    booking.lastmessage = Time.now
    booking.unreadmessages += 1
    authorize booking, :update?
    booking.save
    PageMailer.newmessage(@message, current_user).deliver_now
  end

  private

  def message_params
    params.require(:message).permit(:content, :user_id, :booking_id)
  end

end
