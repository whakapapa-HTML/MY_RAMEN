
FactoryBot.define do
  factory :recipe do
    id  {"1"}
    user_id {"1"}
    genre_id{ "2"}
    name {"レシピ"}
    introduction {"レシピ紹介"}
    serving  {"1"}
    recipe_image  {Rack::Test::UploadedFile.new(File.join(Rails.root, '/spec/factories/fixtures/DSCF9672.JPG'))}
    after(:build) do |built_recipe|
      built_recipe.procedures << build(:procedure, recipe: built_recipe)
    end
    after(:build) do |built_recipe|
      built_recipe.ingredients << build(:ingredient, recipe: built_recipe)
    end
  end
end

