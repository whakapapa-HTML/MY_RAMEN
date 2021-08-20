class Review < ApplicationRecord
  belongs_to	:user
  belongs_to	:recipe

  with_options presence: true do
    validates :title
    validates :body
    validates :evaluation
  end

  validates :evaluation, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }
end
