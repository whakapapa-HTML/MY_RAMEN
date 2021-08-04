class Procedure < ApplicationRecord
  
  belongs_to	:recipe	
  
  validates :explanation, presence: true, length {minimum: 6 }

end
