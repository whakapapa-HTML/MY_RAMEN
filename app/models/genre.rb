class Genre < ApplicationRecord
  
  has_many	:recipes
  
  validates :name, length {minimum: 6 }
  
end
