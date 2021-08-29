
FactoryBot.define do
  factory :review do
    association :user
    association :recipe
    title { Faker::Quote.robin }
    body { Faker::Quote.matz }
    evaluation {"3.5"}
  end
end
