FactoryBot.define do
  factory :valid_favorite, class: Favorite do
    association :portfolio, factory: :valid_portfolio
    association :user, factory: :valid_user
    bookmark_id { portfolio.id }
    fan_id { user.id }

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
