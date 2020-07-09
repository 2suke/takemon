require 'rails_helper'

RSpec.describe FavoritesController, type: :controller do
  let(:saved_portfolio) { create(:valid_portfolio) }
  let(:valid_user) { create(:valid_user) }
  let(:saved_favorite) { create(:valid_favorite) }

  describe 'POST#create' do
    context 'if valid favorite posted' do
      it 'add a portfolio' do
        expect do
          login valid_user
          post :create, params: { portfolio_id: saved_portfolio.id }
        end.to change(Favorite, :count).by(-1)
      end
    end
  end

  describe 'DELETE#destroy' do
    it 'destroy a portfolio' do
      login saved_favorite.fan
      expect do
        delete :destroy, params: { id:saved_favorite.bookmark_id}
      end.to change(Favorite, :count).by(-1)
    end
  end
end
