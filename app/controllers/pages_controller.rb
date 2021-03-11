class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    render template: "pages/about"
  end

  def home
    @clubs = Club.all
    @articles = Article.all
  end
end
