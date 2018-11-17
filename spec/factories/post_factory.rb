FactoryBot.define do
  factory :post do
    content { FFaker::Lorem.sentence }
  end

  factory :too_short_post, parent: :post do
    content { "" }
  end

  factory :too_long_post, parent: :post do
    content { FFaker::Lorem.paragraphs(5) }
  end
end
