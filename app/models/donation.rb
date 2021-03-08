class Donation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :club
  before_create :sync
  monetize :amount_cents
  # after_create :donation_mail

  def sync
    if user 
      self.email = user.email
      self.first_name = user.first_name
      self.last_name = user.last_name
      self.address = user.address
    end
  end
  
  private

  # def donation_mail
  #   UserMailer.with(donation: self).thanks.deliver_now
  # end
end

