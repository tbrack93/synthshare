  class PagesController < ApplicationController
    skip_before_action :authenticate_user!, only: [:home, :about, :contact, :contactmail]

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
    @params = params.permit([:body, :email, :subject]).to_h
    PageMailer.contact(@params).deliver_later
    redirect_to root_path
    end

  end
