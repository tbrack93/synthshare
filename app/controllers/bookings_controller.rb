class BookingsController < ApplicationController
before_action :set_synth
before_action :set_booking, only: [:show, :submit, :status, :destroy]

  def index

  end

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

  def submit
    @booking.status = params[:status]
    @booking.save
    redirect_to dashboard_path
  end

  def status
    @booking.status = params[:status]
    @booking.save
    respond_to do |format|
      format.html { redirect_to dashboard_path }
      format.js
    end
  end

  def destroy
    @booking.destroy
    redirect_to @synth
  end


  private

  def booking_params
    params.require(:booking).permit(:details, :start_time, :end_time)
  end

  def set_booking
    @booking ||= Booking.find(params[:id])
  end

  def set_synth
    @synth = Synth.find(params[:synth_id])
  end

end
