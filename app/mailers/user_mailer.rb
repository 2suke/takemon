class UserMailer < ApplicationMailer
  def account_activation(user)
    @user = user
    mail to: @user.email, subject: '【takemon】アカウントを有効化しましょう'
  end

  def password_reset(user)
    @user = user
    mail to: @user.email, subject: '【takemon】パスワードをリセットします'
  end
end
