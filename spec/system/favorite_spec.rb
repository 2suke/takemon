require 'rails_helper'

feature 'Favorites' do
  let(:active_user)   { create(:active_user) }
  let(:other_user)    { create(:active_user) }
  let(:own_portfolio) { create(:valid_portfolio, user: active_user) }
  let(:portfolio)     { create(:valid_portfolio, user: other_user) }

  scenario 'favorite button switches when user favorite portfolio' do
    e2elogin active_user

    visit portfolio_path(portfolio)

    click_on 'お気に入り登録する'
    expect(page).to have_button 'お気に入りを解除する'

    click_on 'お気に入りを解除する'
    expect(page).to have_button 'お気に入り登録する'
  end

  scenario 'user can not favorite own portfolio' do
    e2elogin active_user

    visit portfolio_path(own_portfolio)

    expect(page).not_to have_button 'お気に入りを解除する'
    expect(page).not_to have_button 'お気に入り登録する'
  end

  scenario 'guest can not favorite' do
    visit portfolio_path(portfolio)

    expect(page).not_to have_button 'お気に入りを解除する'
    expect(page).not_to have_button 'お気に入り登録する'
  end
end
