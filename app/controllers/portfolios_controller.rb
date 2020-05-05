class PortfoliosController < ApplicationController
  def show
    @portfolio = Portfolio.find(params[:id])
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
    @portfolio = Portfolio.find_by(params[:id])
  end

  def update
    @portfolio = Portfolio.find_by(params[:id])
    if @portfolio.update_attributes(portfolio_params)
      flash[:success] = '記事を更新しました。'
      redirect_to @portfolio
    else
      render 'edit'
    end
  end

  def destroy
    portfolio = Portfolio.find(params[:id])
    if current_user == portfolio.user then
      flash[:success] = "「#{portfolio.title}」を削除しました。"
      portfolio.destroy
      redirect_back_or current_user
    else
      log_out
      flash[:danger] = '他のユーザーの作品を不正に削除する操作が行われました。
                        お鐵数ですが、再度ログインしてから削除操作を実行してください。'
      redirect_to login_url
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title, :detail,
                                      images_attributes: %i[description image])
  end
end
