class Review < ApplicationRecord
  
  belongs_to	:user
  belongs_to	:recipe
  
  with_options presence: true do
    validates :title
    validates :body
  end
end
