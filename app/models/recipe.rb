class Recipe < ApplicationRecord
  include ActiveModel::Dirty

  has_many	:reviews,	    dependent: :destroy
  has_many	:bookmarks,	  dependent: :destroy
  has_many	:ingredients,	dependent: :destroy
  has_many	:procedures,	dependent: :destroy
  belongs_to	:user, optional: true
  belongs_to	:genre

  attr_accessor :recipe_image_cache

  mount_uploader :recipe_image, RecipeImageUploader

  accepts_nested_attributes_for :ingredients, :procedures, allow_destroy: true

  with_options presence: true do
    validates :serving
    validates :name
    validates :recipe_image
    validates :introduction
    validates :ingredients
  end

  # 閲覧数を計測可能にする
  is_impressionable counter_cache: true

  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end

  def self.search(search)
    return Recipe.all unless search

    Recipe.where('name LIKE(?)', "%#{search}%")
  end

  scope :genre_ranking, -> { joins(:reviews).group('recipe_id').order('avg(reviews.evaluation) desc') }
  scope :created_today, -> { where(created_at: Time.zone.now.all_day) } # 前日比を計算
  scope :created_yesterday, -> { where(created_at: 1.day.ago.all_day) }
  scope :created_this_week, -> { where(created_at: 6.day.ago.beginning_of_day..Time.zone.now.end_of_day) } # 先週比の計算
  scope :created_last_week, -> { where(created_at: 2.week.ago.beginning_of_day..1.week.ago.end_of_day) }
  scope :created_this_month, lambda { where(created_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_day) }
  scope :created_last_month, -> { where(created_at: 2.month.ago.beginning_of_day..1.month.ago.end_of_day) }
end
