class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!
  def new
    @club = Club.find(params[:club_id])
    @article = Article.new
  end

  def create
    @club = Club.find(params[:club_id])
    @article = Article.new(article_params)
    @article.club = @club
    if @article.save
      redirect_to club_path(@club)
    else
      render 'new'
    end
  end
  
  private
  
  def article_params
    params.require(:article).permit(:title, :description, :photo)
  end
end