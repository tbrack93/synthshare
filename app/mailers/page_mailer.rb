class PageMailer < ApplicationMailer

  def contact(params)
    @body = params[:body]
    mail(
      to: "#{ENV['EMAIL']}",
      subject: "#{params[:subject]} (from #{params[:email]})"
      )
  end


end
