
FactoryBot.define do
  factory :recipe do
    association :user
    association :genre
    name {"レシピ"}
    introduction {"レシピ紹介"}
    serving  {"1"}
    recipe_image  { Rack::Test::UploadedFile.new(File.join(File.join(Rails.root, '/spec/fixtures/images/test.jpg'))) }
    after(:build) do |built_recipe|
      built_recipe.procedures << build(:procedure, recipe: built_recipe)
    end
    after(:build) do |built_recipe|
      built_recipe.ingredients << build(:ingredient, recipe: built_recipe)
    end
  end
end

