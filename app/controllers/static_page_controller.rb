class StaticPageController < ApplicationController
  def home
    @portfolios = Portfolio.all
  end
end
