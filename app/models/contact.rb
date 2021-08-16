class Contact < ApplicationRecord

  belongs_to :user

  with_options presence: true do
    validates :title
    validates :body
  end

  enum status: { 未対応: 0, 対応中: 1, 対応済み: 2 }

end
