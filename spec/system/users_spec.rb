require 'rails_helper'

feature 'Users' do
  let(:valid_user)  { build(:valid_user) }
  let!(:common_user) { create(:active_user) }
  let!(:admin_user)  { create(:admin_user) }

  scenario 'new valid user sign up' do
    visit '/users/new'

    fill_in 'user_name', with: valid_user.name
    fill_in 'user_email', with: valid_user.email
    fill_in 'user_password', with: valid_user.password
    fill_in 'user_password_confirmation', with: valid_user.password
    click_on 'アカウント作成'

    expect(page).to have_content 'ユーザーを登録しました。確認メールを送付したので、アカウントを有効化してください。'
  end

  scenario 'common user can not delete user' do
    e2elogin common_user

    visit users_path

    expect(page).to_not have_content 'delete'
    expect(page).to_not have_link    'delete'
  end

  scenario 'admin user can delete user' do
    e2elogin admin_user

    visit '/users'

    expect(page).to have_content 'delete'
    expect(page).to have_link    'delete'

    click_link 'delete'
    expect(page).to     have_content 'ユーザーを削除しました。'
    expect(page).to_not have_content common_user.email
  end
end
