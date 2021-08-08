class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many	:recipes,	dependent: :destroy	
  has_many	:bookmarks,	dependent: :destroy	
  has_many	:reviews,	dependent: :destroy
  
  with_options presence: true do
    validates :name
    validates :email
    validates :password
  end
  
  validates :introduction, length: { maximum: 150 }
  
end
