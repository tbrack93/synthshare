class PageMailer < ApplicationMailer

  def contact(params)
    @body = params[:body]
    mail(
      to: "#{ENV['EMAIL']}",
      subject: "#{params[:subject]} (from #{params[:email]})"
      )
  end

  def newbooking(bookingid)
    @booking = Booking.find(bookingid)
    @synth = @booking.synth
    mail(
      to: "#{@synth.user.email}",
      subject: "New booking request for #{@synth}"
      )
  end

  def bookingrequest(bookingid, currentuserid)
    @booking = Booking.find(bookingid)
    @synth = @booking.synth
    @user = User.find(currentuserid)
    mail(
      to: "#{@user.email}",
      subject: "Your booking request for #{@synth}"
      )
  end

  def newmessage(messageid, currentuserid)
    @message = Message.find(messageid)
    @user = User.find(currentuserid) #devise current_user not available from mailer
    @booking = @message.booking
    @synth = @booking.synth
    @booking.user == @user ? @recipient = @booking.synth.user : @recipient = @booking.user
    mail(
      to: "#{@recipient.email}",
      subject: "New Message received"
    )
   end
end
