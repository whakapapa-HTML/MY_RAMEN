class Contact < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :title
    validates :body
  end

  enum status: { outstanding: 0, in_progress: 1, closed: 2 }#　日本語NG
end
