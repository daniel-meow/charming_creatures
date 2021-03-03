class ClubsController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    find_club
  end

  def index
    @clubs = Club.all
    @headline = "Super Catchy Phrase"
    if params[:query].present?
      sql_query = "name @@ :query OR category @@ :query OR address @@ :query"
      @clubs = Club.where(sql_query, query: "%#{params[:query]}%")
      @headline = "The following results fit your search for: #{params[:query]}!"
    else
      @clubs = Club.all
    end
  end

  def new
    @club = Club.new
  end

  def create
    @club = Club.new(club_params)
    @club.user_id = current_user.id
    if @club.save
      redirect_to club_path(@club)
    else
      render 'new'
    end
  end

  private

  def find_club
    @club = Club.find(params[:id])
  end

  def club_params
    params.require(:club).permit(:name, :description, :category, :address, photos: [])
  end
end
