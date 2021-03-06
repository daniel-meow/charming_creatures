class DonationsController < ApplicationController
  skip_before_action :authenticate_user!
  def show
    @donation = Donation.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Your_Certificate",
        template: "donations/certificate.html.erb",
        layout: 'pdf.html',
        page_size: "A4",
        margin: {
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
        }
      end
    end
  end

  def new
    @club = Club.find(params[:club_id])
    @donation = Donation.new
  end

  def create
    @club = Club.find(params[:club_id])
    @donation = Donation.new(donation_params)
    @donation.user = current_user
    @donation.club = @club
    @donation.state = "pending"

    if @donation.save

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: @donation.id,
        amount: @donation.amount_cents,
        currency: 'eur',
        quantity: 1
      }],
      success_url: donation_url(@donation),
      cancel_url: donation_url(@donation)
    )

    @donation.update(checkout_session_id: session.id)
    redirect_to new_donation_payment_path(@donation)
    else
      render 'new'
    end
  
  end

  private

  def donation_params
    params.require(:donation).permit(:amount, :first_name, :last_name, :address, :email)
  end
end
