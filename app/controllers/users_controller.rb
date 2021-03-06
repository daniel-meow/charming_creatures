class UsersController < ApplicationController
  def show
    @bookmarks = Bookmark.where(user_id: current_user.id)
    @user = current_user

    if @user.goal
      @donations = @user.donations.map {|donation| donation.amount_cents}.sum / 100
      @donation_percentage = @donations/@user.goal * 100
      @donation_percentage_clean = @donation_percentage.to_i
    end

    @clubs = Club.where(user_id: current_user.id)
  end

  def update_goal
    current_user.goal = params[:goal]
    current_user.save!
    redirect_to profile_path
  end

  private

  # def user_params
  #   # params.permit(:goal, :authenticity_token, :commit)

  #   # raise
  #   @clubs = Club.where(user_id: @user.id)
  # end
end
