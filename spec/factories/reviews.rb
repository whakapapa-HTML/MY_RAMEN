
FactoryBot.define do
  factory :review do
    title { Faker::Quote.robin }
    body { Faker::Quote.matz }
    evaluation {"3.5"}
  end
end
