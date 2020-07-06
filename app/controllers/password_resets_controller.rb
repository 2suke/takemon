class PasswordResetsController < ApplicationController
  before_action :search_missing_user, only: %i[edit update]
  before_action :valid_user, only: %i[edit update]
  before_action :check_expiration, only: %i[edit update]

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = 'パスワード再設定用のURLを送付しました。パスワードを再設定してください。'
      redirect_to root_url
    else
      flash[:danger] = '入力したメールアドレスが見つかりませんでした。メールアドレスを入力し直してください。'
      render 'new'
    end
  end

  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, :blank)
      render 'edit'
    elsif @user.update_attributes(user_params)
      log_in @user
      @user.update_attributes(reset_digest: nil)
      flash[:success] = 'パスワードの再設定が完了しました。'
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def search_missing_user
    @user = User.find_by(email: params[:email])
  end

  def valid_user
    redirect_to root_url unless @user&.activated? && @user&.authenticated?(:reset, params[:id])
  end

  def check_expiration
    return unless @user.password_reset_expired?

    flash[:danger] = 'パスワード再設定の有効期限が切れています。再度パスワードリセットの手続きを行ってください。'
    redirect_to new_password_reset_url
  end
end
