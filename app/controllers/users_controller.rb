class UsersController < ApplicationController
  def show
    @user = current_user
    @user.goal = 90.00

    if @user.goal
      @donations = @user.donations.map {|donation| donation.amount_cents}.sum / 100
      @donation_percentage = @donations/@user.goal * 100
    end
    # raise
  end
end
