class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @recipe = Recipe.find(params[:recipe_id])
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to admin_recipe_reviews_path
  end
end
