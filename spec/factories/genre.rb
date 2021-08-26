
FactoryBot.define do
  factory :genre do
    name { "つけ麺" }
    genre_image { Rack::Test::UploadedFile.new(File.join(File.join(Rails.root, '/spec/fixtures/images/test.jpg'))) }
  end
end
