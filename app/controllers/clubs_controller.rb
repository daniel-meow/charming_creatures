class ClubsController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    find_club
    @short = @club.description.truncate(250);
    @articles = Article.where(club_id: @club.id);
  end

  def index
    @clubs = Club.all
    @headline = "Support animal welfare organizations all over the world with your donation!"
    if params[:query].present?
      sql_query = "clubs.name @@ :query OR clubs.category @@ :query OR clubs.address @@ :query OR species.name @@ :query"
      @clubs = Club.joins(club_species: [:species]).where(sql_query, query: "%#{params[:query]}%")
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
    params.require(:club).permit(:name, :description, :category, :address, :logo, photos: [])
  end
end
