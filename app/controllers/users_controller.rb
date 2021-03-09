class UsersController < ApplicationController
  def show
    @user = current_user
    # @user.goal = 90.00

    if @user.goal
      @donations = @user.donations.map {|donation| donation.amount_cents}.sum / 100
      @donation_percentage = @donations/@user.goal * 100
    end
  end

  def update_goal
    current_user.goal = user_params[:goal]
    current_user.save!
    redirect_to profile_path
  end

  private

  def user_params
    params.permit(:goal, :authenticity_token, :commit)

    # raise
    @clubs = Club.where(user_id: @user.id)
  end
end
