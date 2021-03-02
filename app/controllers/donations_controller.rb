class DonationsController < ApplicationController
  def show
    @donation = Donation.find(params[:id])
  end

  def new
  end

  def create
  end
end
