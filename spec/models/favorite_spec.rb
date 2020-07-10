require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid with a unique pair of a bookmarak_id and a fan_id' do
        favorite = create :valid_favorite
        expect(favorite).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without bookmark_id' do
        favorite = build :portfolioless_favorite
        favorite.valid?
        expect(favorite.errors.messages[:bookmark]).to include('を入力してください')
      end

      it 'is invalid without fan_id' do
        favorite = build :userless_favorite
        favorite.valid?
        expect(favorite.errors.messages[:fan]).to include('を入力してください')
      end
    end
  end
end
