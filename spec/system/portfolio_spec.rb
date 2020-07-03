require 'rails_helper'

feature 'Portfolio' do
  let(:active_user) { create(:active_user) }

  scenario 'Portfolio Upload' do
    e2elogin active_user

    visit new_portfolio_path

    fill_in 'portfolio_title',  with: 'portfolio title'
    fill_in 'portfolio_detail', with: 'portfolio details ¥n' * 3

    # expect(page).to_not have_selector '#slide-1'

    # click_button 'スライドを追加する'
    # wait_for_css_appear('#slide-1') do
    #   expect(page).to have_selector '#slide-1'
    # end

    # attach_file 'portfolio_image_attributes_0_image',
    #             'app/assets/demo/pose_ukkari_man.png'
    # fill_in 'portfolio_image_attributes_0_description',
    #         with: 'image description'

    find('#portfolio_submit').click

    expect(page).to have_content 'portfolio title'

    new_portfolio = Portfolio.find_by(title: 'portfolio title')
    visit portfolio_path(new_portfolio)

    expect(page).to have_selector 'h1',        text: new_portfolio.title
    expect(page).to have_selector '.desc > p', text: new_portfolio.detail
  end

  scenario 'Image Form' do
  #   e2elogin active_user

  #   visit new_portfolio_path

  #   click_button 'スライドを追加する'

  #   expect(page).to have_content '画像'
  #   expect(page).to have_content '注釈文'

  #   attach_file 'portfolio_image_attributes_0_image',
  #               'app/assets/demo/pose_ukkari_man.png'
  #   fill_in 'portfolio_image_attributes_0_description',
  #           with: 'image description'

  #   click_button 'キャンセル'
  #   expect(page).not_to have_content '画像'
  #   expect(page).not_to have_content '注釈文'

  #   click_button 'スライドを追加する'
  #   expect(page).to have_selector '#portfolio_image_attributes_0_image',
  #                                 text: ''
  #   expect(page).to have_selector '#portfolio_image_attributes_0_description',
  #                                 text: ''
  # end
end
