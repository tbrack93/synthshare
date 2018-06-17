class SynthsController < ApplicationController

  def index
    @synths = Synth.all

    @markers = []
    @synths.each do |synth|
      hash = {
          lat: synth.user.latitude,
          lng: synth.user.longitude,
             }
      @markers << hash
    end
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
end
