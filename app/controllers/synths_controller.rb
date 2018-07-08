class SynthsController < ApplicationController
  before_action :set_synth, except: [:new, :index, :create]

  def index
    @synths = Synth.all
    if params[:location].present?
      users = User.near("#{params[:location]} UK", 15)
      location_synths = []
      users.each do |user|
        user.synths.each do |synth|
          location_synths << synth
        end
      end
      if location_synths.empty?
        @searchresults = false
      else
        @synths = location_synths
      end
    end
    @synths.each { |synth| authorize synth, :index? }


    @markers = []
    @synths.each do |synth|
      hash = {
        lat: synth.user.latitude,
        lng: synth.user.longitude,
        infoWindow: { content: render_to_string(partial: "shared/info_window", locals: { synth: synth }) }
      }
      @markers << hash
    end
  end

  def show
    @booking = Booking.new
    authorize @synth
    @markers =
    {
      lat: @synth.user.latitude,
      lng: @synth.user.longitude,
    }
  end

  def new
    @synth = Synth.new
    authorize @synth
  end

  def create
    @synth = Synth.new(synth_params)
    @synth.user = current_user
    authorize @synth
    if @synth.save
      redirect_to synth_path(@synth)
    else
      render "new"
    end
  end

  def edit
    authorize @synth
  end

  def update
    authorize @synth
    @synth.update(synth_params)
    if @synth.save
      redirect_to synth_path(@synth)
    else
      render "edit"
    end
  end

  def destroy
    authorize @synth
    @synth.delete
    redirect_to synths_path
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
