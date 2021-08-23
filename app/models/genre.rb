class Genre < ApplicationRecord
  has_many	:recipes
  mount_uploader :genre_image, GenreImageUploader

  with_options presence: true do
    validates :name
    validates :genre_image
  end
end
