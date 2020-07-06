class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if noob_user?(user)
      account_activate(user)
    else
      flash[:danger] = 'アカウントの有効化に失敗しました。'
      redirect_to root_url
    end
  end

  private

  def account_activate(user)
    user.update_attribute(:activated, true)
    user.update_attribute(:activated_at, Time.zone.now)
    log_in user
    flash[:success] = 'アカウントが有効になりました。あなたの作品を自慢しましょう。'
    redirect_to user
  end

  def noob_user?(user)
    user && !user.activated? && user.authenticated?(:activation, params[:id])
  end
end
