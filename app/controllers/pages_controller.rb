  class PagesController < ApplicationController
    skip_before_action :authenticate_user!, only: :home

    def home
      @synths = Synth.all.first(3)
    end

    def dashboard
    @user = current_user
    @bookings = @user.bookings.where.not(status: "pending")
    end

    def show
    end
  end
