class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[index edit update]
  before_action :correct_user,   only: %i[edit update]

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      @user.send_activation_email
      flash[:success] = 'ユーザーを登録しました。確認メールを送付したので、アカウントを有効化してください。'
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    store_location
    @user = User.find_by(params[:id])
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = 'アカウント情報を更新しました。'
      # redirect_to @user
      redirect_back_or
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'ユーザーを削除しました。'
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = login_link + 'ログインしてください。'
      redirect_to root_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end
end
