class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def show
  end

  def create
    @club = Club.find(params[:club_id])
    @user = current_user  
    @bookmark = Bookmark.new(club: @club, user: @user)
    if @bookmark.save
      redirect_to club_path(params[:club_id])
    else 
      render :new
    end
  end
end
