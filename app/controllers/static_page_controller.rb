class StaticPageController < ApplicationController
  def home
    @portfolios = Portfolio.all.page(params[:page]).per(6)
  end
end
