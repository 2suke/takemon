module AuthenticationHelper
  def login(user)
    session[:user_id] = user
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
  end
end
