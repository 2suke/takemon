require 'rails_helper'

feature 'Sessions' do
  let(:active_user) { create(:active_user) }
  let(:inactive_user) { create(:inactive_user)}

  scenario 'active user sign in/out' do
    visit '/login'

    fill_in 'session_email', with: active_user.email
    fill_in 'session_password', with: active_user.password
    click_on 'commit'

    expect(page).to have_content active_user.name

    click_on 'ログアウト'

    expect(page).to have_content 'ログイン'
  end

  scenario 'inactive user can not sign in' do
    visit '/login'

    fill_in 'session_email', with: inactive_user.email
    fill_in 'session_password', with: inactive_user.password
    click_on 'commit'

    expect(page).to have_content 'アカウントは現在有効ではありません。'
  end
end
