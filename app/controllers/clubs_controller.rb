class ClubsController < ApplicationController
  skip_before_action :authenticate_user!
  def show
    @club = Club.where(id: params[:id])
    @short = @club[0].description.truncate(250);
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

  private

  def club_params
    params.require(:club).permit(:name, :category, :address)
  end
end
