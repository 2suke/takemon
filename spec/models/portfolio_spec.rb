require 'rails_helper'

RSpec.describe Portfolio, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid with a title, detail, and user' do
        portfolio = create :valid_portfolio
        expect(portfolio).to be_valid
      end
    end

    context 'con not save' do
      it 'is invalid without user_id' do
        portfolio = build :userless_portfolio
        portfolio.valid?
        expect(portfolio.errors.messages[:user]).to include('を入力してください')
      end

      it 'is invalid without title' do
        portfolio = build :titleless_portfolio
        portfolio.valid?
        expect(portfolio.errors.messages[:title]).to include('を入力してください')
      end

      it 'is invalid with too long title' do
        portfolio = build :long_title_portfolio
        portfolio.valid?
        expect(portfolio.errors.messages[:title]).to include('は30文字以内で入力してください')
      end

      it 'is invalid without detail' do
        portfolio = build :detailless_portfolio
        portfolio.valid?
        expect(portfolio.errors.messages[:detail]).to include('を入力してください')
      end
    end
  end
end
