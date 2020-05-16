require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid with valid comment and owner' do
        comment = create :valid_comment
        expect(comment).to be_valid
      end
    end
  end

  context 'con not save' do
    it 'is invalid without owner' do
      comment = build :userless_comment
      comment.valid?
      expect(comment.errors.messages[:user]).to include('を入力してください')
    end

    it 'is invalid without message' do
      comment = build :messageless_comment
      comment.valid?
      expect(comment.errors.messages[:message]).to include('を入力してください')
    end

    it 'is invalid with long message over 140 charactors' do
      comment = build :long_message_comment
      comment.valid?
      expect(comment.errors.messages[:message]).to include('は140文字以内で入力してください')
    end
  end
end
