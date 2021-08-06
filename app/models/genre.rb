class Genre < ApplicationRecord

  has_many	:recipes
  mount_uploader :genre_image, GenreImageUploader
  
end
