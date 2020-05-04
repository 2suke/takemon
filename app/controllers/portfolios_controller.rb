class PortfoliosController < ApplicationController
  def show
    @portfolio = Portfolio.find(params[:id])
  end

  def Index

  end

  def new
    if logged_in? then
      @portfolio = current_user.portfolios.build
      10.times {
        @image = @portfolio.images.build
      }
    else
      redirect_to login_url
    end
  end

  def create
    @portfolio = current_user.portfolios.build(portfolio_params)
    @portfolio.images.order(:image)
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

  def portfolio_params
    params.require(:portfolio).permit(:title, :detail,
                                      images_attributes: %i[description image])
  end
end
