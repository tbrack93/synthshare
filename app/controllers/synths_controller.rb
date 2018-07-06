class SynthsController < ApplicationController
before_action :set_synth, except: [:new, :index, :create]

  def index
    if params[:location].present?
      users = User.near(params[:location], 20)
      location_synths = []
      users.each do |user|
        user.synths.each do |synth|
          location_synths << synth
        end
      end
      @synths = location_synths
    else
    @synths = Synth.all
    end

    @markers = []
    @synths.each do |synth|
      hash = {
          lat: synth.user.latitude,
          lng: synth.user.longitude,
             }
      @markers << hash
    end
  end

  def show
    @booking = Booking.new
    @markers =
  {
    lat: @synth.user.latitude,
    lng: @synth.user.longitude,
  }
  end


  def new
    @synth = Synth.new
  end

  def create
    @synth = Synth.new(synth_params)
    @synth.user = current_user
    if @synth.save
      redirect_to synth_path(@synth)
    else
      render "new"
    end
  end


private
  def synth_params
    params.require(:synth).permit(:name, :description, :body_format, :price, :model_no, :processor, :memory, :battery_life, :build_date,
    :cleaning, :cooking, :childcare, :diy, :construction, :painting, :gardening, :healthcare,
    :elderlycare, :animalcare, :driving, :self_defense, :security, :entertainment, :photo, :cardiothoracic,
    :quantumelectrodynamics, :architecturalengineering)
  end

  def set_synth
    @synth = Synth.find(params[:id])
  end
end
