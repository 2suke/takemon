require 'rails_helper'

RSpec.describe Image, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid with portfolio' do
        image = create :valid_image
        expect(image).to be_valid
      end
    end

    context 'con not save' do
      it 'is invalid without portfolio_id' do
        image = build :drifted_image
        image.valid?
        expect(image.errors.messages[:portfolio_id]).to include('を入力してください')
      end

      it 'is invalid with too long description' do
        image = build :long_desc_image
        image.valid?
        expect(image.errors.messages[:description]).to include('は30文字以内で入力してください')
      end
    end
  end
end
