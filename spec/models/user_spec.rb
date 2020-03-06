require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a name, email, and password' do
    user = User.new(
      name: 'michael',
      email: 'america@example.com',
      password: 'password'
    )
    expect(user).to be_valid
  end
end
