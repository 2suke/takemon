require 'rails_helper'

RSpec.describe PortfoliosController, type: :controller do
  let(:saved_portfolio) { create(:valid_portfolio) }

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
end
