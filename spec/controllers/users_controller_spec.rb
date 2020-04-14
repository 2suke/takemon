require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:saved_user) { create(:valid_user) }
  let(:unsaved_user) { build(:valid_user) }

  describe 'GET#show' do
    it 'assigns valid_user' do
      get :show, params: { id: saved_user }
      expect(assigns(:user)).to eq saved_user
    end
  end

  # describe 'POST#create' do
  #   post :create, params: { user: { name: unsaved_user.name,
  #                                   email: unsaved_user.email,
  #                                   password: unsaved_user.password,
  #                                   password_confirmation: unsaved_user.password } }
  #   expect(response.status).to equal(200)
  # end
end
