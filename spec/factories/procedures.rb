
FactoryBot.define do
  factory :procedure do
    explanation {"レシピの説明です"}
    procedure_image { Rack::Test::UploadedFile.new(File.join(Rails.root, "/spec/factories/fixtures/DSCF9672.JPG")) }
  end
end
