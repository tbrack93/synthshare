class BookingsController < ApplicationController
before_action :set_synth
before_action :set_booking, only: [:show]

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.synth = @synth
    @booking.price = @synth.price * (@booking.end_time - @booking.start_time)
    if @booking.save
      redirect_to synth_booking_path(@synth, @booking)
    else
      render "new"
    end
  end

  def show
    redirect_to @synth unless @booking.user == current_user
  end

  private

  def booking_params
    params.require(:booking).permit(:details, :start_time, :end_time)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_synth
    @synth = Synth.find(params[:synth_id])
  end

end
