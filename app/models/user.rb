class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :recipes,	dependent: :destroy
  has_many :bookmarks,	dependent: :destroy
  has_many :reviews,	dependent: :destroy
  has_many :reverse_of_relationships,	class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  has_many :relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower
  has_many :followings, through: :relationships, source: :followed
  has_many :contacts, dependent: :destroy

  with_options presence: true do
    validates :name
    validates :email
    validates :password, on: :create # 新規登録するときにのみバリデーションによる入力チェックがかかるように変更
  end
  
  validates :introduction, length: { maximum: 150 }
  
  # superで渡された引数を親クラスに受け渡しできる

  def active_for_authentication?
    super && (is_deleted == false)
  end
  
  # フォロー機能のメソッド

  def follow(user_id)
    relationships.create(followed_id: user_id)
  end
  
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end
  
  def following?(user)
    followings.include?(user)
  end
  
end
