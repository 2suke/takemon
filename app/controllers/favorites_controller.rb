class FavoritesController < ApplicationController
  def create
    @portfolio = Portfolio.find(params[:portfolio_id])
    current_user.add_bookmark(@portfolio)
    respond_to do |format|
      format.html { redirect_to @portfolio }
      format.js
    end
  end

  def destroy
    @portfolio = Portfolio.find(params[:id])
    current_user.cancel_bookmark(@portfolio)
    respond_to do |format|
      format.html { redirect_to @portfolio }
      format.js
    end
  end
end
