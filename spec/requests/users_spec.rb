require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:saved_user) { create(:valid_user) }
  let(:admin_user) { create(:admin_user) }

  describe 'GET#show' do
    it 'assigns valid user' do
      get :show, params: { id: saved_user }
      expect(assigns(:user)).to eq saved_user
    end
  end

  describe 'GET#new' do
    it 'returns status code 200' do
      get :new
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST#create' do
    context 'if valid_user posted' do
      it 'increment user count' do
        expect do
          post :create, params: { user: FactoryBot.attributes_for(:valid_user) }
        end.to change(User, :count).by(1)
      end

      it 'redirect to root url' do
        post :create, params: { user: FactoryBot.attributes_for(:valid_user) }
        expect(response).to redirect_to '/'
      end
    end

    context 'if invalid user posted' do
      it 'does not add a user account' do
        expect do
          post :create,
               params: { user: FactoryBot.attributes_for(:nameless_user) }
        end.to change(User, :count).by(0)
      end
    end
  end

  describe 'DELETE#destroy' do
    it 'decrement user count' do
      login admin_user
      saved_user.save
      expect do
        delete :destroy, params: { id: saved_user }
      end.to change(User.all, :count).by(-1)
    end
  end
end
