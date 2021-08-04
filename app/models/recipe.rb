class Recipe < ApplicationRecord

  has_many	:reviews,	    dependent: :destroy
  has_many	:bookmarks,	  dependent: :destroy
  has_many	:ingredients,	dependent: :destroy
  has_many	:procedures,	dependent: :destroy
  belongs_to	:user
  belongs_to	:genre

  accepts_nested_attributes_for :ingredients, :procedures

  with_options presence: true do
    validates :serving
    validates :name, length: { minimum: 6 }
    validates :introduction, length: {minimum: 6 }
    validates :ingredientsz
    validates :procedures
  end

end
