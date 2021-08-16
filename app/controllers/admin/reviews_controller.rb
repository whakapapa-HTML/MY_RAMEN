class Admin::ReviewsController < ApplicationController

  def index
    @recipe = Recipe.find(params[:recipe_id])
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to admin_recipe_reviews_path
  end
end
