class PaymentsController < ApplicationController
  skip_before_action :authenticate_user!
  def new
    @donation = Donation.where(state: 'pending').find(params[:donation_id])
    UserMailer.with(donation: @donation).thanks.deliver_now
  end
end
