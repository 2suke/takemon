FactoryBot.define do
  images_paths = []
  10.times do |n|
    images_paths.push("spec/factories/slide_test/number_#{n}.png")
  end

  sequence(:image) { |n| image_file_path(n, images_paths) }

  factory :based_image, class: Image do
    description { 'description' }

    trait :attached do
      association :portfolio, factory: :valid_portfolio
    end

    trait :long_description do
      description { 'a' * 31 }
    end

    # For unit test
    # It uses not numbered file path
    trait :for_ut do
      SAMPLE_PATH = 'spec/factories/slide_test/number_0.png'.freeze
      image do
        Rack::Test::UploadedFile.new(File.join(Rails.root, SAMPLE_PATH),
                                     'image/png')
      end
    end

    factory :valid_image,     traits: %i[attached for_ut]
    factory :drifted_image,   traits: []
    factory :long_desc_image, traits: %i[attached long_description for_ut]

    factory :valid_image_st,  traits: [:attached]
  end
end
