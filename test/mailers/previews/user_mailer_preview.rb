# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/thanks
  def thanks
    donation = Donation.first
    UserMailer.with(donation: donation).thanks
  end

end
