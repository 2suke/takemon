# require 'rails_helper'

FactoryBot.define do
  sequence(:email){ |n| "example#{n}@sample.com" }

  factory :valid_user, class: User do
    name { 'michael' }
    email
    password { 'password' }

    trait :nameless do
      name { '' }
    end

    trait :long_name do
      name { 'a' * 51 }
    end

    trait :mailless do
      email { '' }
    end

    trait :passwordless do
      password { '' }
    end

    trait :short_password do
      password { 'a' * 5 }
    end

    trait :long_password do
      password { 'a' * 17 }
    end

    trait :active do
      activated { 'true' }
    end

    trait :inactive do
      activated { 'false' }
    end

    trait :admin do
      admin { true }
    end

    factory :nameless_user,       traits: [:nameless]
    factory :long_name_user,      traits: [:long_name]
    factory :mailless_user,       traits: [:mailless]
    factory :passwordless_user,   traits: [:passwordless]
    factory :short_password_user, traits: [:short_password]
    factory :long_password_user,  traits: [:long_password]
    factory :active_user,         traits: [:active]
    factory :inactive_user,       traits: [:inactive]
    factory :admin_user,          traits: %i[admin active]
  end
end
