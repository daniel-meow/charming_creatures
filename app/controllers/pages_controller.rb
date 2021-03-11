class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @clubs = Club.all
    @articles = Article.all
  end
end
