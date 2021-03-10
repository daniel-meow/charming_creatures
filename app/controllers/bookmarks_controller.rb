class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.where(user_id: current_user.id)
  end

  def show
  end

  def destroy
    @bookmark = Bookmark.where(club_id: params[:club_id]).where(user_id: current_user.id)
    @bookmark.destroy_all
    
    redirect_to club_path(params[:club_id])
    
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
