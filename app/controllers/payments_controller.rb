class PaymentsController < ApplicationController
  skip_before_action :authenticate_user!
  def new
    @donation = Donation.where(state: 'pending').find(params[:donation_id])
  end
end
