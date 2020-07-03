require 'rails_helper'

feature 'Users' do
  let(:valid_user)  { build(:valid_user) }
  let(:common_user) { create(:valid_user) }
  let(:admin_user)  { create(:admin_user) }

  scenario 'new valid user sign up' do
    visit '/users/new'

    fill_in 'user_name', with: valid_user.name
    fill_in 'user_email', with: valid_user.email
    fill_in 'user_password', with: valid_user.password
    fill_in 'user_password_confirmation', with: valid_user.password
    click_on 'アカウント作成'

    expect(page).to have_content 'ユーザーを登録しました。確認メールを送付したので、アカウントを有効化してください。'
  end

  # scenario 'common user can not delete user' do
  #   login common_user

  #   visit users_path

  #   expect(page).to_not have_content 'delete'
  #   expect(page).to_not have_link    'delete'
  # end
end
