class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      if user.activated?
        invite_active_user(user)
      else
        reject_noob_user
      end
    else
      flash.now[:danger] = 'メールアドレスまたはパスワードが間違っています。お手数ですがもう一度入力してください。'
      render 'new'
    end
  end

  def guest
    user = User.find_by(email: 'guest@takemon.org')
    log_in user
    redirect_back_or user
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private

  def invite_active_user(user)
    log_in user
    params[:session][:remember_me] == '1' ? remember(user) : forget(user)
    redirect_back_or user
  end

  def reject_noob_user
    message  = 'アカウントは現在有効ではありません。'
    message += 'アカウント登録時に受信したメールを確認し、アカウントを有効にしてください。'
    flash[:warning] = message
    redirect_to root_url
  end
end
