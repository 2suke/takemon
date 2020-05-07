require 'rails_helper'

RSpec.describe Image, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid with portfolio' do
        image = create :valid_image
        expect(image).to be_valid
      end

      it 'has portfolio_id after saved' do
        image = create :valid_image
        expect(image.portfolio_id).not_to be nil
      end
    end

    context 'con not save' do
      it 'is invalid with too long description' do
        image = build :long_desc_image
        image.valid?
        expect(image.errors.messages[:description]).to include('は30文字以内で入力してください')
      end
    end
  end
end
