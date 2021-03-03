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
    @donation.club = @club
    if @donation.save
      redirect_to club_path(@club)
    else
      render 'new'
    end
  end

  private

  def donation_params
    params.require(:donation).permit(:amount)
  end
end
