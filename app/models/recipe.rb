class Recipe < ApplicationRecord

  has_many	:reviews,	    dependent: :destroy
  has_many	:bookmarks,	  dependent: :destroy
  has_many	:ingredients,	dependent: :destroy
  has_many	:procedures,	dependent: :destroy
  belongs_to	:user, optional: true
  belongs_to	:genre

  mount_uploader :recipe_image, RecipeImageUploader
  attr_accessor :recipe_image_cache

  accepts_nested_attributes_for :ingredients, :procedures, allow_destroy: true

  with_options presence: true do
    validates :serving
    validates :name
    validates :introduction, length: { minimum: 6 }
    validates :ingredients
  end

end
