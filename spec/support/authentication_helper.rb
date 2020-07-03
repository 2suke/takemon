require 'rails_helper'

module AuthenticationHelper
  def login(user)
    session[:user_id] = user
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
  end

  def e2elogin(user)
    visit '/login'

    fill_in 'session_email', with: user.email
    fill_in 'session_password', with: user.password
    click_on 'commit'
  end
end
