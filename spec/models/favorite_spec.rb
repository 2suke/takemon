require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe '#create' do
    context 'cansave' do
      it 'is valid with a unique pair of a bookmarak_id and a fan_id'
    end

    context 'can not save' do
      it 'is invalid without bookmark_id'
      it 'is invalid without fan_id'
      it 'is invalid with a deplicated pair of a bookmarak_id and a fan_id'
    end
  end
end
