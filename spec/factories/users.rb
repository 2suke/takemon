# require 'rails_helper'

FactoryBot.define do
  sequence(:email){|n| "example#{n}@sample.com"}

  factory :valid_user, class: User do
    name { 'michael' }
    email
    password { 'password' }
  end

  factory :nameless_user, class: User do
    name { '' }
    email
    password { 'password' }
  end

  factory :long_name_user, class: User do
    name { 'a' * 51 }
    email
    password { 'password' }
  end

  factory :mailless_user, class: User do
    name { 'michael' }
    email { '' }
    password { 'password' }
  end

  factory :passwordless_user, class: User do
    name { 'michael' }
    email
    password { '' }
  end

  factory :short_password_user, class: User do
    name { 'michael' }
    email
    password { 'a' * 5 }
  end

  factory :long_password_user, class: User do
    name { 'michael' }
    email
    password { 'a' * 17 }
  end
end
