require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid with a name, email, and password' do
        user = create :valid_user
        expect(user).to be_valid
      end
    end

    context 'con not save' do
      it 'is invalid without name' do
        user = build :nameless_user
        user.valid?
        expect(user.errors.messages[:name]).to include('を入力してください')
      end

      it 'is invalid with long name over 50 charactors' do
        user = build :long_name_user
        user.valid?
        expect(user.errors.messages[:name]).to include('は50文字以内で入力してください')
      end

      it 'is invalid without email' do
        user = build :mailless_user
        user.valid?
        expect(user.errors.messages[:email]).to include('を入力してください')
      end

      it 'is invalid with long email over 255 charactors' do
        user = build :mailless_user
        user.valid?
        expect(user.errors.messages[:email]).to include('を入力してください')
      end

      it 'is invalid with invalid format mail address' do
        invalid_addresses = %w[ user@example,
                                com user_at_foo.org
                                user.name@example.
                                foo@bar_baz.com
                                foo@bar+baz.com ]
        invalid_addresses.each do |address|
          user = build(:mailless_user, email: address)
          user.valid?
          expect(user.errors.messages[:email]).to include('は不正な値です')
        end
      end

      it 'must have unique email address' do
        user = create :valid_user
        another_user = build(:mailless_user, email: user.email)
        another_user.valid?
        expect(another_user.errors.messages[:email]).to include('はすでに存在します')
      end

      it 'is invalid without password' do
        user = build :passwordless_user
        user.valid?
        expect(user.errors.messages[:password]).to include('を入力してください')
      end

      it 'is invalid with short password less 6 charactors' do
        user = build :short_password_user
        user.valid?
        expect(user.errors.messages[:password]).to include('は6文字以上で入力してください')
      end

      it 'is invalid with long password over 16 charactors' do
        user = build :long_password_user
        user.valid?
        expect(user.errors.messages[:password]).to include('は16文字以内で入力してください')
      end
    end
  end
end
