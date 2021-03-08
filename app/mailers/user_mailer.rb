class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.thanks.subject
  #
  def thanks
    @donation = params[:donation]
    mail(to: @donation.email, subject: "Thanks for donating")
  end
end
