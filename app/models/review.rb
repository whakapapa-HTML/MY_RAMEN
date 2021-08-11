class Review < ApplicationRecord

  belongs_to	:user
  belongs_to	:recipe

  with_options presence: true do
    validates :title
    validates :body
    validates :evaluation
  end
end
