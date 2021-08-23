
FactoryBot.define do
  factory :genre do
    id {"1"}
    name { "つけ麺" }
    genre_image { Rack::Test::UploadedFile.new(File.join(Rails.root, '/spec/factories/fixtures/DSCF9672.JPG')) }
  end
end