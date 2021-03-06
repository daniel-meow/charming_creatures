class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    find_article
  end

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

  def destroy
    @article = Article.find(params[:id])
    @club = @article.club
    @article.destroy
    redirect_to club_path(@club)
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :photo)
  end

  def find_article
    @article = Article.find(params[:id])
  end

end
