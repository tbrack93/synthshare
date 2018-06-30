class BookingsController < ApplicationController
before_action :set_synth

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.synth = @synth
    @booking.price = @synth.price
    if @booking.save
      redirect_to synth_path(@synth)
    else
      render "new"
    end
  end



  private

  def booking_params
    params.require(:booking).permit(:details, :start_time, :end_time)
  end

  def set_synth
    @synth = Synth.find(params[:synth_id])
  end

end
