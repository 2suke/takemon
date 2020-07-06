class PortfoliosController < ApplicationController
  before_action :check_portfolio_owner, only: %i[edit update destroy]

  def show
    store_location
    @portfolio = Portfolio.find(params[:id])
    @comment = Comment.new
    @comments = @portfolio.comments
  end

  def new
    if logged_in?
      @portfolio = current_user.portfolios.build
      10.times do
        @image = @portfolio.images.build
      end
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
    @portfolio = Portfolio.find(params[:id])
    @portfolio.images.each do |image|
      image.image.cache! unless image.image.blank?
    end
  end

  def update
    @portfolio = Portfolio.find(params[:id])
    if @portfolio.update_attributes(portfolio_params)
      flash[:success] = '記事を更新しました。'
      redirect_to @portfolio
    else
      render 'edit'
    end
  end

  def destroy
    portfolio = Portfolio.find(params[:id])
    flash[:success] = "「#{portfolio.title}」を削除しました。"
    portfolio.destroy
    redirect_back_or current_user
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title, :detail,
                                      images_attributes: %i[description image])
  end

  def check_portfolio_owner
    portfolio = Portfolio.find(params[:id])
    return if current_user == portfolio.user

    log_out
    store_location
    flash[:danger] = "以下のいずれかの問題が検出されました¥n
                      ・他のユーザーの作品を編集しようとしている¥n
                      ・ログイン情報が失効している¥n
                      お鐵数ですが、再度ログインしてから削除操作を実行してください。"
    redirect_to login_url
  end
end
