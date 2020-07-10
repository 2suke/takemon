FactoryBot.define do
  factory :valid_favorite, class: Favorite do
    association :bookmark, factory: :valid_portfolio
    association :fan, factory: :valid_user

    trait :portfolio_less do
      bookmark {}
    end

    trait :user_less do
      fan {}
    end

    factory :portfolioless_favorite, traits: [:portfolio_less]
    factory :userless_favorite,      traits: [:user_less]
  end
end
