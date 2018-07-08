  class PagesController < ApplicationController
    skip_before_action :authenticate_user!, only: :home

    def home
      @synths = Synth.all.first(3)
    end

    def dashboard
    @user = current_user
    @bookings = @user.bookings.where.not(status: "pending")
    @bookings.each { |booking| authorize booking, :index? }
    end

    def show
    end

    def contact
    end

    def about
    end

    def contactmail
    PageMailer.contact(params).deliver_now
    redirect_to synths_path
    end

  end
