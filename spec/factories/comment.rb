FactoryBot.define do
  factory :based_comment, class: Comment do
    message { 'message' }

    trait :owned do
      association :user, factory: :valid_user
    end

    trait :messageless do
      message { '' }
    end

    trait :long_message do
      message { 'a' * 141 }
    end

    trait :to_portfolio do
      association :portfolio, factory: :valid_user
    end

    trait :to_comment do
      association :base, factory: :valid_comment
    end

    factory :valid_comment, traits: %i[owned]
    factory :userless_comment, traits: %i[]
    factory :messageless_comment, traits: %i[owned messageless]
    factory :long_message_comment, traits: %i[owned long_message]
    factory :portfolio_comment, traits: %i[owned to_portfolio]
    factory :reply_comment, traits: %i[owned to_comment]
  end
end
