FactoryBot.define do
  factory :based_portfolio, class: Portfolio do
    title { 'title' }
    detail { 'detail' }

    trait :owned do
      association :user, factory: :valid_user
    end

    trait :titleless do
      title { '' }
    end

    trait :long_title do
      title { 'a' * 31 }
    end

    trait :detailless do
      detail { '' }
    end

    factory :valid_portfolio,      traits: [:owned]
    factory :userless_portfolio,   traits: []
    factory :titleless_portfolio,  traits: %i[owned titleless]
    factory :long_title_portfolio, traits: %i[owned long_title]
    factory :detailless_portfolio, traits: %i[owned detailless]
  end
end
