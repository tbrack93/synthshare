class PageMailer < ApplicationMailer

  def contact(params)
    @body = params[:body]
    mail(
      to: "#{ENV['EMAIL']}",
      subject: "#{params[:subject]} (from #{params[:email]})"
      )
  end

  def newbooking(message)
    @message = message
    @booking = message.booking
    @synth = @booking.synth
    mail(
      to: "#{@message.booking.synth.user.email}",
      subject: "New booking request for #{message.booking.synth}"
      )
  end

  def newmessage(message, currentuser)
    @message = message
    @booking = message.booking
    @synth = @booking.synth
    @user = currentuser #devise current_user not available from mailer
    @booking.user == @user ? @recipient = @booking.synth.user : @recipient = @booking.user
    mail(
      to: "#{@recipient.email}",
      subject: "New Message received"
    )
   end
end
