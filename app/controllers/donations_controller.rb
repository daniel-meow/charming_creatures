class DonationsController < ApplicationController
  skip_before_action :authenticate_user!
  def show
    @donation = Donation.find(params[:id])
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
    if @donation.save
      redirect_to donation_path(@donation)
    else
      render 'new'
    end
  end

  private

  def donation_params
    params.require(:donation).permit(:amount, :first_name, :last_name, :address, :email)
  end
end
