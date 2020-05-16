require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:saved_reply) { create(:reply_comment) }
  let(:unsaved_reply) { create(:reply_comment) }
  let(:saved_user) { create(:valid_user) }
  let(:saved_portfolio) { create(:valid_portfolio) }

  describe 'GET#show' do
    it 'assigns valid comment' do
      get :show, params: { id: saved_reply }
      expect(assigns(:comment)).to eq saved_reply
    end
  end

  describe 'POST#create' do
    it 'add portfolio comment' do
      login saved_user
      comment_param = { comment: FactoryBot.attributes_for(:portfolio_comment).merge(to_portfolio: saved_portfolio.id) }
    end

    it 'add reply comment' do
      login saved_user
      reply_param = { comment: FactoryBot.attributes_for(:reply_comment).merge(to_comment: saved_reply.id) }
      expect do
        post :create, params: reply_param
      end.to change(Comment, :count).by(1)
    end
  end
end
