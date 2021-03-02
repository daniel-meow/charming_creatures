class ClubsController < ApplicationController
  skip_before_action :authenticate_user!
  def show
    @club = Club.where(id: params[:id])
  end

  def index
  end
end
