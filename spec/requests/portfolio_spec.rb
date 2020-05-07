require 'rails_helper'

RSpec.describe PortfoliosController, type: :controller do
  let(:saved_portfolio) { create(:valid_portfolio) }
  let(:unsaved_portfolio) { build(:valid_portfolio) }
  let(:valid_user) { create(:valid_user) }

  describe 'GET#show' do
    it 'assigns valid portfolio' do
      get :show, params: { id: saved_portfolio }
      expect(assigns(:portfolio)).to eq saved_portfolio
    end
  end

  describe 'GET#new' do
    it 'returns status code 200' do
      login(saved_portfolio.user.id)
      get :new
      expect(response).to have_http_status(:ok)
    end

    it 'renders login url when not logged in' do
      logout
      get :new
      expect(response).to redirect_to '/login'
    end
  end

  describe 'POST#create' do
    context 'if valid portfolio posted' do
      it 'add a portfolio' do
        expect do
          login valid_user
          post :create, params: { portfolio: FactoryBot.attributes_for(:valid_portfolio) }
        end.to change(Portfolio, :count).by(1)
      end

      it 'redirect to show portfolio url' do
        login valid_user
        post :create, params: { portfolio: FactoryBot.attributes_for(:valid_portfolio) }
        expect(response).to redirect_to "/users/#{valid_user.id}"
      end
    end
  end

  describe 'GET#edit' do
    it 'assigns valid portfolio' do
      login(saved_portfolio.user.id)
      get :edit, params: { id: saved_portfolio.id }
      expect(assigns(:portfolio)).to eq saved_portfolio
    end

    it 'redirect to login if portfolio user is not current user' do
      login valid_user
      get :edit, params: { id: saved_portfolio.id }
      expect(response).to redirect_to '/login'
    end
  end

  describe 'POST#update' do
    it 'update portfolio params if portfolio user is not current user' do
      login saved_portfolio.user
      @portfolio = saved_portfolio
      post :update, params: { id: saved_portfolio.id,
                              portfolio: { title: 'changed title',
                                           detail: 'changed detail' } }
      expect(@portfolio.reload.title).to eq 'changed title'
    end

    it 'redirect to login if portfolio user is not current user' do
      login valid_user
      post :update, params: { id: saved_portfolio.id,
                              portfolio: { title: 'changed title' } }
      expect(response).to redirect_to '/login'
    end
  end

  describe 'DELETE#destroy' do
    context 'if user delete his own portfolio' do
      it 'destroy a portfolio' do
        login saved_portfolio.user
        expect do
          delete :destroy, params: { id: saved_portfolio }
        end.to change(Portfolio, :count).by(-1)
      end

      it 'redirect to user page' do
        login saved_portfolio.user
        delete :destroy, params: { id: saved_portfolio }
        expect(response).to redirect_to "/users/#{saved_portfolio.user.id}"
      end
    end

    context "if user delete other user's portfolio" do
      it 'dose not destroy a portfolio' do
        login valid_user
        saved_portfolio.save
        expect do
          delete :destroy, params: { id: saved_portfolio }
        end.to change(Portfolio, :count).by(0)
      end

      it 'redirect to login page' do
        login valid_user
        saved_portfolio.save
        delete :destroy, params: { id: saved_portfolio }
        expect(response).to redirect_to '/login'
      end
    end
  end
end
