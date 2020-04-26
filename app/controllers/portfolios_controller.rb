class PortfoliosController < ApplicationController
  def show

  end

  def Index

  end

  def new
    @portfolio = current_user.portfolios.build
  end

  def create
    @portfolio = current_user.portfolios.build(portfolio_param)
    if @portfolio.save
      flash[:success] = '作品を投稿しました。'
      redirect_to current_user
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    
  end

  def destroy

  end

  private

  def portfolio_param
    params.require(:portfolio).permit(:title, :detail)
  end
end
