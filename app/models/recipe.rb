class Recipe < ApplicationRecord
  include ActiveModel::Dirty

  has_many	:reviews,	    dependent: :destroy
  has_many	:bookmarks,	  dependent: :destroy
  has_many	:ingredients,	dependent: :destroy
  has_many	:procedures,	dependent: :destroy
  belongs_to	:user, optional: true
  belongs_to	:genre

  attr_accessor :recipe_image_cache
  mount_uploader :recipe_image, RecipeImageUploader

  accepts_nested_attributes_for :ingredients, :procedures, allow_destroy: true

  with_options presence: true do
    validates :serving
    validates :name
    validates :introduction, length: { minimum: 6 }
    validates :ingredients
  end

  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end

end
